/// Product
abstract class TextFormat {
  String get content;

  @override
  String toString() => '$runtimeType(\n'
      '$content'
      '\n)';
}
