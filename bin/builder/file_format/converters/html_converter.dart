import '../formats/html_format.dart';
import '../color_reader/color_text_reader.dart';

/// Builder
class HtmlConverter extends Converter<HtmlFormat> {
  @override
  HtmlFormat get result => _html..closeAllTags();

  @override
  void writeColor(String color) {
    _html
        .addStyle(name: color, color: color)
        .openTagSpan(styleName: color)
        .writeText(color)
        .closeLastTag();
  }

  @override
  void writeWord(String text) {
    _html.writeText('$text ');
  }

  final _html = HtmlFormat()..openTagP();
}
