/// Director
class ColorTextReader {
  final String text;

  ColorTextReader({required this.text});

  TextFormat convert(Converter converter) {
    for (final word in text.split(' ')) {
      if (supportedColors.contains(word)) {
        converter.writeColor(word);
      } else {
        converter.writeWord(word);
      }
    }
    return converter.result;
  }

  final supportedColors = Set.unmodifiable(['red', 'green', 'blue']);
}

/// Builder
abstract class Converter<T extends TextFormat> {
  void writeWord(String text);

  void writeColor(String color);

  T get result;
}

/// Product
abstract class TextFormat {
  String get content;

  @override
  String toString() => '$runtimeType(\n'
      '$content'
      '\n)';
}
