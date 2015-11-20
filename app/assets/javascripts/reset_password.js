$().ready(function(){
  $('input[type=password]').focus(function(){
    $('label.error.confirmation').hide();
  });

  $('input[type=submit]').click(function(){
    if($('#user_password').val() != $('#user_password_confirmation').val()) {
      $('label.error.confirmation').show();
      return false;
    } else {
      $('label.error.confirmation').hide();
    }
  });
});
