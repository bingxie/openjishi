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

  $("#product_tag_list").select2({
    tags:true,
    tokenSeparators: [",", " ", "，"],
    // selectOnBlur: true,
    // formatNoMatches: () => {
    //   return '';
    // },
    dropdownCssClass: 'select2-hidden',
  });
})

