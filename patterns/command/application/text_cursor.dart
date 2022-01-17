class TextCursor {
  int get position => _position;

  int get startSelection => _startSelection ?? _position;

  int get endSelection => position;

  bool get isTextSelected => _startSelection != null;

  final int _position;

  int? _startSelection;

  TextCursor.fromPosition(this._position);

  TextCursor.fromSelection(this._startSelection, this._position);
}
