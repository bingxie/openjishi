var select2ChinaCity = {
  init: () => {
    select2CnMatcher.init($(".city-select.city-province, .city-select.city-city, .city-select.city-district"));

    select2ChinaCity.loadDynamicData();
  },

  loadDynamicData: () => {
    $( ".city-select.city-city").on('china_city:load_data_completed', select2ChinaCity.onDataChange);
    $( ".city-select.city-district").on('china_city:load_data_completed', select2ChinaCity.onDataChange);
  },

  onDataChange: (event) => {
    $(event.currentTarget).trigger('change');
  },
};

$(document).on("page:change", () => {
  if($(".c-profiles.a-edit").length > 0) select2ChinaCity.init();
  if($(".c-products.a-new").length > 0) select2ChinaCity.init();
});
