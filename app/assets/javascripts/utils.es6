// for select2

function matchChinese(term, text) {
  let mod, hanzi, inFull, inShort;
  mod = simplePinyin(text);
  hanzi = text.toUpperCase().indexOf(term.toUpperCase()) == 0;
  inFull = mod.full.toUpperCase().indexOf(term.toUpperCase()) != -1;
  inShort = mod.short.toUpperCase().indexOf(term.toUpperCase()) != -1;
  return hanzi || inFull || inShort;
}
