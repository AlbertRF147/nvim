module.exports = grammar({
  name: "haml",

  extras: $ => [
    $.comment,
    /\s+/,
  ],

  rules: {
    source_file: ($) => repeat($._node),
    _node: ($) => choice(
      $.tag,
      $.comment,
    ),
    tag: $ => prec(2, repeat1($._tag)),
    _tag: ($) => seq($._tag_start, $._tag_name, optional($.class_name)),
    _tag_start: _ => /[%\.#]/,
    _tag_name: _ => /(\w(-?))+/,
    class_name: _ => /\.(\w+(-?))+/,
    comment: $ => /\/\/((\s+(\w+))+)?/,
  },
});
