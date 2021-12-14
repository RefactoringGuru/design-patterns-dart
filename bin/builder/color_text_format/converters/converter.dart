import '../formats/text_format.dart';

/// Builder
abstract class Converter<T extends TextFormat> {
  void writeWord(String text);

  void writeColor(String color);

  T get result;
}
