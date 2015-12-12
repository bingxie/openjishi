const confirmationError = {
  init: () => {
    confirmationError.passwordFocus();
    confirmationError.formSubmit();
  },

  passwordFocus: () => {
    $('#reset_password input[type=password]').focus(confirmationError.hideError);
  },

  formSubmit: () => {
    $('#reset_password input[type=submit]').click(confirmationError.onSubmit);
  },

  onSubmit: () => {
    if ($('#user_password').val() != $('#user_password_confirmation').val()) {
      confirmationError.showError();
      return false;
    } else {
      confirmationError.hideError();
    }
  },

  hideError: () => {
    $('label.error.confirmation').hide();
  },

  showError: () => {
    $('label.error.confirmation').show();
  },
};

$(document).on("page:change", () => {
  if($(".c-users-passwords.a-edit").length > 0) confirmationError.init();
});
