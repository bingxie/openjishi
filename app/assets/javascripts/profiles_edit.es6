function formWithSaveIcons(formId) {
  const savingHide = () => {
    $(formId + ' .saving-icon').hide();
  };

  const savedHide = () => {
    $(formId + ' .save-done').hide();
  };

  const init = () => {
    savingHide();
    savedHide();

    $(formId).submit(() => {
      // no front end validation errors
      if($(formId).find('label.error').length == 0) {
        $(formId + " .saving-icon").fadeIn('slow');
      }
    });

    $(formId + ' input').focus(() => {
      savedHide();
    });
  };

  const showDone = () => {
    $(formId + ' .save-done').show();
    savingHide();
  };

  return {
    init: init,
    showDone: showDone,
  };
};

const avatarCropper = {
  init() {
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
  },
};

$(document).on("page:change", () => {
  if($(".c-profiles.a-edit").length > 0) {
    formWithSaveIcons("#change_password").init();
    formWithSaveIcons("#edit_profile_info").init();
    formWithSaveIcons("#avatar_upload").init();
  }
});
