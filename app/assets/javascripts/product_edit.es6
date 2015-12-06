$().ready(() => {
  $.fn.select2.amd.require(['select2/compat/matcher'], oldMatcher => {
    $("#product_parent_category, #product_category_id, #product_brand_id, #product_quality").select2({
      width: 'resolve',
      language: "zh-CN",
      matcher: oldMatcher(select2ChinaCity.matchChinese)
    });
  });

  // Category and Brand selection
  $("#product_parent_category").on("change", () => {
    let parentCategoryId = $("#product_parent_category").val();
    $.get("/categories/show?parent_category_id=" + parentCategoryId, (data) => {
      $('#product_category_id').html(data).change();
    });
  });

  $("#product_category_id").on("change", () => {
    let categoryId = $("#product_category_id").val();
    $.get("/categories/show?category_id=" + categoryId, (data) => {
      $('#product_brand_id').html(data).change();
    });
  });

  // Number only input
  $("#product_price, #product_price_in_province, #product_price_out_province").keyup( (event) => {
    let price = $(event.currentTarget)
    price.val(price.val().replace(/[^0-9\.]/g,''));
  });

  // Tags with select2
  $("#product_tag_list").select2({
    tags:true,
    tokenSeparators: [",", "，"],
    // selectOnBlur: true,
    // formatNoMatches: () => {
    //   return '';
    // },
    dropdownCssClass: 'select2-hidden',
  });

  $("#product_tag_list").on("change", (e) => {
    $('.error.length, .error.max').hide();

    let tags = $(e.currentTarget).val();
    if (tags.length > 10) {
      $('.error.max').show();
    }

    if (tags.pop().length > 6) {
      $('.error.length').show();
    };
  });

  // Express prices
  $('input:radio[name="product[delivery_method]"]').change((event) => {
    $('.shipping-method .error.message').hide();
    if($(event.currentTarget).val() === 'express') {
      $("#express_note").show();
      $("#product_price_in_province, #product_price_out_province").enableClientSideValidations();
    } else {
      $("#express_note").hide();
    }
  });

  $('#new_product input[type=submit]').click(() => {
    window.ClientSideValidations.callbacks.form.after = (form, eventData) => {
      // Validate delivery method
      if ($('input:radio[name="product[delivery_method]"]:checked').length === 0) {
        $('.shipping-method .error.message').show();
        return false;
      };
    };
  });
})

