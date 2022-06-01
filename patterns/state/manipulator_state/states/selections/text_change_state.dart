import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shapes/text_shape.dart';
import 'selection_state.dart';

class TextChangeState extends SelectionState<TextShape> {
  TextChangeState({
    required Offset startPointer,
    required super.selectedShape,
  })  : _startPointer = startPointer,
        _textCursor = TextCursor(selectedShape);

  @override
  void init() {
    _textCursor.changePosition(_startPointer.dx, _startPointer.dy);
    context.cursor = SystemMouseCursors.text;
    context.update();
  }

  @override
  void mouseDown(double x, double y) {
    if (selectedShape.rect.contains(Offset(x, y))) {
      _textCursor.changePosition(x, y);
      context.update();
      return;
    }

    super.mouseDown(x, y);
  }

  @override
  void keyDown(KeyEvent keyEvent) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      if (keyEvent.physicalKey == PhysicalKeyboardKey.backspace) {
        _textCursor.backspace();
        context.update();
      } else if (keyEvent.character != null) {
        _textCursor.inputText(keyEvent.character!);
        context.update();
      }
    }
  }

  @override
  void paint(Canvas canvas) {
    context.paintStyle.paintSelectedText(selectedShape, canvas);
    super.paint(canvas);
    context.paintStyle.paintTextCursor(_textCursor, selectedShape, canvas);
  }

  @override
  void onHover() {
    if (hoverShape == selectedShape) {
      context.cursor = SystemMouseCursors.text;
    }
  }

  @override
  void onMouseLeave() {
    context.cursor = SystemMouseCursors.basic;
  }

  double xx0 = 0;
  int len = 0;
  final Offset _startPointer;
  final TextCursor _textCursor;

  @override
  String toString() {
    return '${super.toString()} + Text Change State';
  }
}

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
