
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


$().ready(function(){
  $("#select-main-category").select2();
  $("#select-sub-category").select2();
  $("#select-brand").select2();
  $("#select-condition").select2();
  $("#province").select2();
  $("#city").select2();
  $("#select-2-demo,#select-2-1,#select-2-2,#select-2-3").select2();
})