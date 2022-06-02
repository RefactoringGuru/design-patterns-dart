import 'dart:ui';

import '../../../shapes/text_shape.dart';

class TextCursor {
  TextCursor(this._shape);

  double get xCoordinate => _xPosition;

  void changePosition(double x) {
    x = x - _shape.x;

    final pos = _shape.paragraph.getPositionForOffset(Offset(x, _shape.y));

    _charIndex = pos.offset;
    _xPosition = _shape.x;

    final range = _shape.paragraph.getBoxesForRange(
      pos.offset - 1,
      pos.offset,
    );

    if (range.isNotEmpty) {
      _xPosition += range.first.right;
    }
  }

  void inputText(String char) {
    _changeText(char: char);
    moveRight();
  }

  void backspace() {
    if (_charIndex <= 0) {
      return;
    }

    _changeText(removeChars: -1);
    moveLeft();
  }

  void moveLeft() {
    _charIndex--;
    _xPosition = _shape.x;

    if (_charIndex <= 0) {
      _charIndex = 0;
      return;
    }

    final range = _shape.paragraph.getBoxesForRange(_charIndex - 1, _charIndex);

    if (range.isNotEmpty) {
      _xPosition += range.first.right;
    }
  }

  void moveRight() {
    _charIndex++;
    _xPosition = _shape.x;

    if (_charIndex >= _shape.text.length) {
      _charIndex = _shape.text.length;
      _xPosition += _shape.width;
      return;
    }

    final range = _shape.paragraph.getBoxesForRange(_charIndex - 1, _charIndex);

    if (range.isNotEmpty) {
      _xPosition += range.first.right;
    }
  }

  void _changeText({String char = '', int removeChars = 0}) {
    final start = _shape.text.substring(0, _charIndex + removeChars);
    final end = _shape.text.length > start.length
        ? _shape.text.substring(_charIndex)
        : '';
    _shape.text = '$start$char$end';
  }

  final TextShape _shape;
  int _charIndex = 0;
  double _xPosition = 0;
}
