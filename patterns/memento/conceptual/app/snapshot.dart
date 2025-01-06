import 'editor.dart';

/// EN: The memento class stores the past state of the editor.
///
/// RU: Снимок хранит прошлое состояние редактора.
class Snapshot {
  final Editor _editor;
  final String _text;
  final int _curX;
  final int _curY;
  final int _selectionWidth;

  Snapshot(
      this._editor,
      this._text,
      this._curX,
      this._curY,
      this._selectionWidth,
      );

  /// EN: At some point, a previous state of the editor can be
  /// restored using a memento object.
  ///
  /// RU: В нужный момент владелец снимка может восстановить
  /// состояние редактора.
  void restore() {
    _editor
      ..text = _text
      ..curX = _curX
      ..curY = _curY
      ..selectionWidth = _selectionWidth;
  }
}
