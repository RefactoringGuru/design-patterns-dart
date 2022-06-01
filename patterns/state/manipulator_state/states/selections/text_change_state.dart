import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shapes/text_shape.dart';
import 'selection_state.dart';
import 'text/text_cursor.dart';

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
