import '../formats/json_format.dart';
import 'converter.dart';

class JsonConverter extends Converter<JsonFormat> {
  @override
  JsonFormat get result {
    _closeTextBuffer();
    return _json;
  }

  final _json = JsonFormat();

  @override
  void writeColor(String color) {
    _closeTextBuffer();
    _json.add({
      'color': color,
    });
  }

  @override
  void writeWord(String text) => _textBuffer.write('$text ');

  final _textBuffer = StringBuffer();

  void _closeTextBuffer() {
    if (_textBuffer.isNotEmpty) {
      _json.add({
        'text': _textBuffer.toString(),
      });
      _textBuffer.clear();
    }
  }
}
