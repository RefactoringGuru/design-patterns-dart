import 'dart:ui';

import '../../../shapes/text_shape.dart';

class TextCursor {
  TextCursor(this._shape);

  double get xCoordinate => _xPosition;

  void changePosition(double x, double y) {
    x = x - _shape.x;
    y = y - _shape.y;

    final pos = _shape.paragraph.getPositionForOffset(Offset(x, y));
    _charIndex = pos.offset;

    final range = _shape.paragraph.getBoxesForRange(
      pos.offset - 1,
      pos.offset,
    );

    _xPosition = _shape.x;

    if (range.isNotEmpty) {
      _xPosition += range.first.right;
    }
  }

  String inputText(String char) {
    final start = _shape.text.substring(0, _charIndex);
    final end = _shape.text.substring(_charIndex);
    _shape.text = '$start$char$end';
    final range = _shape.paragraph.getBoxesForRange(_charIndex, ++_charIndex);
    _xPosition = _shape.x;

    if (range.isNotEmpty) {
      _xPosition += range.first.right;
    }

    return '$start$char$end';
  }

  void backspace() {
    if (_charIndex <= 0) {
      return;
    }

    final start = _shape.text.substring(0, _charIndex - 1);
    final end = _shape.text.length > start.length
        ? _shape.text.substring(_charIndex)
        : '';

    _shape.text = '$start$end';

    final range = _shape.paragraph.getBoxesForRange(_charIndex - 1, _charIndex);
    _xPosition = _shape.x;

    if (range.isNotEmpty) {
      _xPosition += range.first.left;
    } else {
      _xPosition += _shape.width;
    }
    _charIndex--;
  }

  final TextShape _shape;
  int _charIndex = 0;
  double _xPosition = 0;
}
