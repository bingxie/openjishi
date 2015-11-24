
$(document).ready(function() {
   $('input[type="radio"]').change(function() {
       if($(this).attr('id') == 'carrier') {
            $('.note').show();
       }

       else {
            $('.note').hide();
       }
   });
});

$(document).ready(function(){
    $('.prd-preview-image-large').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.prd-preview-image-thumbnail'
    });
    $('.prd-preview-image-thumbnail').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      asNavFor: '.prd-preview-image-large',
      dots: true,
      centerMode: true,
      focusOnSelect: true
    });
  });


$().ready(function(){
  $("#select-main-category").select2();
  $("#select-sub-category").select2();
  $("#select-brand").select2();
  $("#select-condition").select2();
  $("#province").select2();
  $("#city,#gender,#dob-yy,#dob-mm,#dob-dd").select2();
  $("#select-2-demo,#select-2-1,#select-2-2,#select-2-3").select2();
})