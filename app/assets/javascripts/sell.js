
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
})