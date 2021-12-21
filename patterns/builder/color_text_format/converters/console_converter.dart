import '../formats/console_format.dart';
import 'converter.dart';

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
