const confirmationError = {
  init() {
    this.passwordFocus();
    this.formSubmit();
  },

  passwordFocus() {
    $('#reset_password input[type=password]').focus(this.hideError);
  },

  formSubmit() {
    $('#reset_password input[type=submit]').click(this.onSubmit);
  },

  onSubmit() {
    if ($('#user_password').val() != $('#user_password_confirmation').val()) {
      confirmationError.showError(); //
      return false;
    } else {
      confirmationError.hideError(); //
    }
  },

  hideError() {
    $('label.error.confirmation').hide();
  },

  showError() {
    $('label.error.confirmation').show();
  },
};

$(document).on("page:change", () => {
  if($(".c-users-passwords.a-edit").length > 0) confirmationError.init();
});
