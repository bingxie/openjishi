$().ready(() => {
  init_form("#change_password");
  init_form("#edit_profile_info");
  init_form("#avatar_upload");
});

function init_form(formId) {
  $(formId + ' .saving-icon').hide();
  $(formId + ' .save-done').hide();

  $(formId).submit(function(){
    // no front end validation errors
    if($(formId).find('label.error').length == 0) {
      $(formId + " .saving-icon").fadeIn('slow');
    }
  });

  $(formId + ' input').focus(() => {
    $(formId + ' .save-done').hide();
  });
}

function show_done(formId) {
  $(formId + ' .save-done').show();
  $(formId + ' .saving-icon').hide();
}

function load_avatar_cropper() {
  $('#avatar-cropbox').cropper({
    // modal: false,
    zoomable: false,
    // background: false,
    aspectRatio: 1 / 1,
    crop: function(e) {
      $('#crop_x').val(e.x);
      $('#crop_y').val(e.y);
      $('#crop_width').val(e.width);
      $('#crop_height').val(e.height);
    }
  });
}
