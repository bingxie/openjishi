$().ready(() => {
  $.fn.select2.amd.require(['select2/compat/matcher'], oldMatcher => {
    $("#profile_province_id").select2({
      width: 'resolve',
      language: "zh-CN",
      matcher: oldMatcher(matchChinese)
    });

    $("#profile_city_id").select2({
      width: 'resolve',
      language: "zh-CN",
      matcher: oldMatcher(matchChinese)
    });

    $("#profile_district_id").select2({
      language: "zh-CN",
      matcher: oldMatcher(matchChinese)
    });
  });

  $( "#profile_city_id").on('china_city:load_data_completed',() => {
    $("#profile_city_id").trigger('change');
  });

  $( "#profile_district_id").on('china_city:load_data_completed',() => {
    $("#profile_district_id").trigger('change');
  });

  load_change_password();
});

function load_change_password() {
  $('#change_password_form').load('/users/edit', () => {
    $('#change_password').enableClientSideValidations();
  });
}

function load_avatar_cropper() {
  $('#avatar-cropbox').cropper({
    modal: false,
    zoomable: false,
    background: false,
    aspectRatio: 1 / 1,
    crop: function(e) {
      $('#crop_x').val(e.x);
      $('#crop_y').val(e.y);
      $('#crop_width').val(e.width);
      $('#crop_height').val(e.height);
    }
  });
}
