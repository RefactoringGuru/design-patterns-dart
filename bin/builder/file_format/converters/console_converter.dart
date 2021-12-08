import '../formats/console_format.dart';
import '../color_text_reader.dart';

class ConsoleConverter extends Converter<ConsoleFormat> {
  @override
  final result = ConsoleFormat();

  @override
  void writeColor(String color) {
    result.color = color;
    result.write(color);
    result.color = 'black';
  }

  @override
  void writeWord(String text) => result.write(text);
}
