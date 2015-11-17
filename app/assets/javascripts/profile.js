$().ready(function(){
  $.fn.select2.amd.require(['select2/compat/matcher'], function (oldMatcher) {
    $("#user_profile_attributes_province_id").select2({
      width: 'resolve',
      language: "zh-CN",
      matcher: oldMatcher(matchChinese),
    });

    $("#user_profile_attributes_city_id").select2({
      width: 'resolve',
      language: "zh-CN",
      matcher: oldMatcher(matchChinese),
    });

    $("#user_profile_attributes_district_id").select2({
      language: "zh-CN",
      matcher: oldMatcher(matchChinese),
    });
  });
});
