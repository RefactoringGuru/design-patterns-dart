import '../text/text.dart';

class WordIterator extends Iterator<String> {
  WordIterator(this._text);

  @override
  String get current => _currWord!;

  @override
  bool moveNext() {
    final start = _lastIndex;

    while (_searchNextSpaceChar(' ')) {
      // ++
    }

    _currWord = _getWord(start, _lastIndex);
    return _currWord!.isNotEmpty;
  }

  final Text _text;
  int _lastIndex = 0;
  String? _currWord;

  bool _searchNextSpaceChar(String char) {
    final isTextEnd = _lastIndex >= _text.text.length;

    if (isTextEnd) {
      return false;
    }

    final isNotSpaceChar = _text.text[_lastIndex++] != char;
    return isNotSpaceChar;
  }

  String _getWord(int start, int end) {
    final noWordChars = RegExp(r'\W');
    return _text.text
        .substring(
          start,
          _lastIndex,
        )
        .replaceAll(
          noWordChars,
          '',
        );
  }
}
