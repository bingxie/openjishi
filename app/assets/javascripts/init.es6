var App = {
};

App.init = () => {
  // Global function init
  console.log('App initited.');
}

$(document).on("page:change", () => {
  App.init();
});


