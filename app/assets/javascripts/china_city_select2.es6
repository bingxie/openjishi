var select2ChinaCity = {
  init: () => {
    $.fn.select2.amd.require(['select2/compat/matcher'], select2ChinaCity.chineseMatcher);
    select2ChinaCity.loadDynamicData();
  },

  chineseMatcher: oldMatcher => {
    $(".city-select.city-province, .city-select.city-city, .city-select.city-district").select2({
      width: 'resolve',
      language: "zh-CN",
      matcher: oldMatcher(select2ChinaCity.matchChinese)
    });
  },

  matchChinese: (term, text) => {
    let mod, hanzi, inFull, inShort;
    mod = simplePinyin(text);
    hanzi = text.toUpperCase().indexOf(term.toUpperCase()) == 0;
    inFull = mod.full.toUpperCase().indexOf(term.toUpperCase()) != -1;
    inShort = mod.short.toUpperCase().indexOf(term.toUpperCase()) != -1;
    return hanzi || inFull || inShort;
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
  if($(".profiles.edit").length > 0) select2ChinaCity.init();
  if($(".products.new").length > 0) select2ChinaCity.init();
});
