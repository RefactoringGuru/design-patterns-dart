import 'text/text.dart';

void main() {
  final text = Text(
    'Iterator is a behavioral design pattern that lets you traverse elements '
    'of a collection without exposing its underlying representation '
    '(list, stack, tree, etc.).',
  );

  for (final s in text) {
    print(s);
  }
}
