import '../pattern/word_iterator.dart';

class Text extends Iterable<String> {
  final String text;

  Text(this.text);

  @override
  Iterator<String> get iterator => WordIterator(this);
}
