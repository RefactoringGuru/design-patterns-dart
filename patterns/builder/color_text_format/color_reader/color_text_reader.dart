import '../converters/converter.dart';
import '../formats/text_format.dart';

/// Director
class ColorTextReader {
  final String text;

  ColorTextReader({required this.text});

  T convert<T extends TextFormat>(Converter<T> converter) {
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
