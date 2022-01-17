class Editor {
  var _text = '';

  String get text {
    if (selectedText.isNotEmpty) {
      final selectedText = _text.substring(
        _startSelection!,
        _textCursorPosition,
      );
      return _text.replaceRange(
        _startSelection!,
        _textCursorPosition,
        '[$selectedText]',
      );
    }

    return _text.replaceRange(_textCursorPosition, _textCursorPosition, '|');
  }

  int _textCursorPosition = 0;

  int? _startSelection;

  void inputText(String addText) {
    if (_startSelection == null) {
      _text = _text.replaceRange(
        _textCursorPosition,
        _textCursorPosition,
        addText,
      );
      _textCursorPosition += addText.length;
      return;
    }
    _text = _text.replaceRange(_startSelection!, _textCursorPosition, addText);
    textCursorPosition = _startSelection! + addText.length;
  }

  void selectText(int start, int? end) {
    end = end ?? _text.length;
    assert(start < end, 'start: $start, end: $end');
    _startSelection = start;
    _textCursorPosition = end;
  }

  void removeSelected() {
    if (_startSelection == null) {
      return;
    }

    _text = _text.replaceRange(_startSelection!, _textCursorPosition, '');
    textCursorPosition = _startSelection!;
  }

  set textCursorPosition(int newPosition) {
    _startSelection = null;
    _textCursorPosition = newPosition;
  }

  int get textCursorPosition => _textCursorPosition;

  int? get startSelection => _startSelection;

  String get selectedText {
    if (_textCursorPosition > _text.length) {
      return '';
    }

    return _text.substring(
      _startSelection ?? _textCursorPosition,
      _textCursorPosition,
    );
  }
}
