import 'dart:ui';

import '../../../shapes/text_shape.dart';

class TextCursor {
  TextCursor(this._textShape) : _xPosition = _textShape.x;

  double get xCoordinate => _xPosition;

  void changePosition(double x) {
    x = x - _textShape.x;

    final pos =
        _textShape.paragraph.getPositionForOffset(Offset(x, _textShape.y));

    _charIndex = pos.offset;
    _xPosition = _textShape.x;

    final range = _textShape.paragraph.getBoxesForRange(
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
    _xPosition = _textShape.x;

    if (_charIndex <= 0) {
      _charIndex = 0;
      return;
    }

    final range =
        _textShape.paragraph.getBoxesForRange(_charIndex - 1, _charIndex);

    if (range.isNotEmpty) {
      _xPosition += range.first.right;
    }
  }

  void moveRight() {
    _charIndex++;
    _xPosition = _textShape.x;

    if (_charIndex >= _textShape.text.length) {
      _charIndex = _textShape.text.length;
      _xPosition += _textShape.width;
      return;
    }

    final range =
        _textShape.paragraph.getBoxesForRange(_charIndex - 1, _charIndex);

    if (range.isNotEmpty) {
      _xPosition += range.first.right;
    }
  }

  void _changeText({String char = '', int removeChars = 0}) {
    final start = _textShape.text.substring(0, _charIndex + removeChars);
    final end = _textShape.text.length > start.length
        ? _textShape.text.substring(_charIndex)
        : '';
    _textShape.text = '$start$char$end';
  }

  final TextShape _textShape;
  int _charIndex = 0;
  late double _xPosition = 0;
}
