const select2CnMatcher = (() => {
  // private
  const matchChinese = (term, text) => {
    let mod, hanzi, inFull, inShort;
    mod = simplePinyin(text);
    hanzi = text.toUpperCase().indexOf(term.toUpperCase()) == 0;
    inFull = mod.full.toUpperCase().indexOf(term.toUpperCase()) != -1;
    inShort = mod.short.toUpperCase().indexOf(term.toUpperCase()) != -1;
    return hanzi || inFull || inShort;
  };

  // public
  const init = (selects) => {
    $.fn.select2.amd.require(['select2/compat/matcher'], oldMatcher => {
      selects.select2({
        width: 'resolve',
        language: "zh-CN",
        matcher: oldMatcher(matchChinese)
      });
    });
  };

  return { init: init };
})();
