$().ready(() => {
  $.fn.select2.amd.require(['select2/compat/matcher'], oldMatcher => {
    $(".city-select.city-province, .city-select.city-city, .city-select.city-district").select2({
      width: 'resolve',
      language: "zh-CN",
      matcher: oldMatcher(matchChinese)
    });
  });

  $( ".city-select.city-city").on('china_city:load_data_completed',(event) => {
    $(event.currentTarget).trigger('change');
  });

  $( ".city-select.city-district").on('china_city:load_data_completed',(event) => {
    $(event.currentTarget).trigger('change');
  });
});
