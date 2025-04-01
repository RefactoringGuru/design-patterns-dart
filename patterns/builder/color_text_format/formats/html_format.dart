import 'dart:collection';
import 'text_format.dart';

// product
class HtmlFormat extends TextFormat {
  final _openTag = Queue<Tag>();
  final _content = StringBuffer();

  HtmlFormat openTagP() {
    final tag = Tag('p');
    _openTag.add(tag);
    _content.write('  $tag\n   ');
    return this;
  }

  final _styles = <String, String>{};

  HtmlFormat addStyle({required String name, required String color}) {
    _styles[name] = color;
    return this;
  }

  HtmlFormat openTagSpan({String? styleName}) {
    final tag = Tag('span', styleName);
    _openTag.add(tag);
    _content.write('\n   $tag');
    return this;
  }

  HtmlFormat writeText(String text) {
    _content.write(text);
    return this;
  }

  HtmlFormat closeLastTag() {
    final tagName = _openTag.removeLast().name;
    _content.write('</$tagName> ');
    return this;
  }

  HtmlFormat closeAllTags() {
    while (_openTag.isNotEmpty) {
      closeLastTag();
    }
    return this;
  }

  @override
  String get content {
    final styleContent = _styles.entries
        .map((e) => '.${e.key} { color: ${e.value}; }')
        .join('\n      ');

    return '''<!DOCTYPE html>
  <html>
  <head>
  <title>Color text</title>
    <style>
      $styleContent
    </style>
  </head>
  <body>
$_content
  </body>
</html>''';
  }
}

class Tag {
  final String name;
  final String? className;
  final text = StringBuffer();

  Tag(this.name, [this.className]);

  @override
  String toString() {
    final cls = className != null ? ' class="$className"' : '';
    return '<$name$cls>$text';
  }
}
