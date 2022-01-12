import '../formats/json_format.dart';
import 'converter.dart';

class JsonConverter extends Converter<JsonFormat> {
  @override
  JsonFormat get result => _json;

  final _json = JsonFormat();

  @override
  void writeColor(String color) {
    if (_textBuffer.isNotEmpty) {
      _json.add({
        'text': _textBuffer.toString(),
      });
      _textBuffer.clear();
    }
    _json.add({
      'text': color,
      'color': color,
    });
  }

  final _textBuffer = StringBuffer();

  @override
  void writeWord(String text) => _textBuffer.write('$text ');
}
