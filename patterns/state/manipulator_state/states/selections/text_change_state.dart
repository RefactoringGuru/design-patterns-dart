import 'dart:async';

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
    _textCursor.changePosition(_startPointer.dx);
    context.cursor = SystemMouseCursors.text;

    _cursorAnimateTimer = Timer.periodic(Duration(milliseconds: 500), (_) {
      _isShowCursor = !_isShowCursor;
      context.update();
    });

    context.update();
  }

  @override
  void mouseDown(double x, double y) {
    if (selectedShape.rect.contains(Offset(x, y))) {
      _textCursor.changePosition(x);
      _isShowCursor = true;
      context.update();
      return;
    }

    _cursorAnimateTimer.cancel();
    super.mouseDown(x, y);
  }

  @override
  void keyDown(KeyEvent keyEvent) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      if (keyEvent.physicalKey == PhysicalKeyboardKey.backspace) {
        _textCursor.backspace();
      } else if (keyEvent.physicalKey == PhysicalKeyboardKey.arrowLeft) {
        _textCursor.moveLeft();
      } else if (keyEvent.physicalKey == PhysicalKeyboardKey.arrowRight) {
        _textCursor.moveRight();
      } else if (keyEvent.character != null) {
        _textCursor.inputText(keyEvent.character!);
      }

      _isShowCursor = true;
      context.update();
    }
  }

  @override
  void paint(Canvas canvas) {
    context.paintStyle.paintSelectedText(selectedShape, canvas);
    super.paint(canvas);

    if (_isShowCursor) {
      context.paintStyle.paintTextCursor(_textCursor, selectedShape, canvas);
    }
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

  @override
  String toString() {
    return '${super.toString()} + Text Change State';
  }

  final Offset _startPointer;
  final TextCursor _textCursor;
  bool _isShowCursor = true;
  late Timer _cursorAnimateTimer;
}
