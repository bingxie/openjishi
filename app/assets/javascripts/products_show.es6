const imageSlick = {
  init() {
    this.initSlick();
    this.initGallery();
  },

  initSlick() {
    $('.prd-preview-image-large').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.prd-preview-image-thumbnail'
    });

    $('.prd-preview-image-thumbnail').slick({
      slidesToShow: 4,
      slidesToScroll: 1,
      asNavFor: '.prd-preview-image-large',
      dots: true,
      centerMode: true,
      focusOnSelect: true
    });
  },

  initGallery() {
    $('.gallery').featherlightGallery();
  },
}

$(document).on("page:change", () => {
  if($(".c-products.a-show").length > 0) {
    imageSlick.init();
  }
});
