import 'color_reader/color_text_reader.dart';
import 'converters/html_converter.dart';
import 'converters/json_converter.dart';
import 'converters/console_converter.dart';

void main() {
  final reader = ColorTextReader(
    text: 'I love looking at the blue sky, '
        'eating red apples, '
        'sitting on the green grass.',
  );

  final html = reader.convert(HtmlConverter());
  final json = reader.convert(JsonConverter());
  final console = reader.convert(ConsoleConverter());

  print(
    '$html,\n\n'
    '$json,\n\n'
    '$console,\n\n',
  );
}
