import '../formats/json_format.dart';
import '../color_text_reader.dart';

class JsonConverter extends Converter<JsonFormat> {
  @override
  final result = JsonFormat();

  @override
  void writeColor(String color) {
    throw UnimplementedError();
  }

  @override
  void writeWord(String text) {
    throw UnimplementedError();
  }
}
