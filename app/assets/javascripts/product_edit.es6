$().ready(() => {
  $.fn.select2.amd.require(['select2/compat/matcher'], oldMatcher => {
    $("#product_parent_category, #product_category_id, #product_brand_id, #product_quality").select2({
      width: 'resolve',
      language: "zh-CN",
      matcher: oldMatcher(matchChinese)
    });
  });

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

  $("#product_price, #product_price_in_province, #product_price_out_province").keyup( (event) => {
    let price = $(event.currentTarget)
    price.val(price.val().replace(/[^0-9\.]/g,''));
  });

  $("#product_tag_list").select2({
    tags:true,
    tokenSeparators: [",", " ", "，"],
    // selectOnBlur: true,
    // formatNoMatches: () => {
    //   return '';
    // },
    dropdownCssClass: 'select2-hidden',
  });

  $('input:radio[name="product[delivery_method]"]').change((event) => {
    if($(event.currentTarget).val() === 'express') {
      $("#express_note").show();
      $("#product_price_in_province, #product_price_out_province").enableClientSideValidations();
    } else {
      $("#express_note").hide();
    }
  });
})

