$().ready(() => {
  $('input[type=password]').focus(() => {
    $('label.error.confirmation').hide();
  });

  $('input[type=submit]').click(() => {
    if ($('#user_password').val() != $('#user_password_confirmation').val()) {
      $('label.error.confirmation').show();
      return false;
    } else {
      $('label.error.confirmation').hide();
    }
  });
});
