class Editor {
  var _text = '';

  String get text {
    return isTextSelected
        ? _text.replaceRange(
            _startSelection!,
            _textCursorPosition,
            '[$selectedText]',
          )
        : _text.replaceRange(
            _textCursorPosition,
            _textCursorPosition,
            '|',
          );
  }

  void inputText(String addText) {
    if (_startSelection == null) {
      _insertText(addText);
    } else {
      _replaceSelection(addText);
    }
  }

  void _replaceSelection(String replaceText) {
    _text = _text.replaceRange(
      _startSelection!,
      _textCursorPosition,
      replaceText,
    );
    textCursorPosition = _startSelection! + replaceText.length;
  }

  void _insertText(String insertText) {
    _text = _text.replaceRange(
        _textCursorPosition, _textCursorPosition, insertText);
    _textCursorPosition += insertText.length;
  }

  void selectText(int start, int? end) {
    end = end ?? _text.length;
    assert(start < end, 'start: $start, end: $end');
    _startSelection = start;
    _textCursorPosition = end;
  }

  void removeSelected() {
    if (_startSelection != null) {
      _replaceSelection('');
    }
  }

  bool get isTextSelected => _startSelection != null;

  String get selectedText {
    if (_textCursorPosition > _text.length) {
      return '';
    }

    return _text.substring(
      _startSelection ?? _textCursorPosition,
      _textCursorPosition,
    );
  }

  int? _startSelection;

  int? get startSelection => _startSelection;

  int _textCursorPosition = 0;

  set textCursorPosition(int newPosition) {
    _startSelection = null;
    _textCursorPosition = newPosition;
  }

  int get textCursorPosition => _textCursorPosition;
}
