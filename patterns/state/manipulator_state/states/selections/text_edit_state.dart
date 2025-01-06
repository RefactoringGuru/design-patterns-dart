import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shapes/text_shape.dart';
import 'selection_state.dart';
import 'text/keyboard_actions.dart';
import 'text/text_cursor.dart';
import 'text/text_cursor_animation.dart';

class TextEditState extends SelectionState<TextShape> {
  TextEditState({
    required Offset startPointer,
    required super.selectedShape,
  }) : _startPointer = startPointer;

  @override
  void init() {
    _textCursor = TextCursor(selectedShape)..changePosition(_startPointer.dx);

    _keyboardActions = KeyboardActions(
      actions: {
        PhysicalKeyboardKey.backspace: _textCursor.backspace,
        PhysicalKeyboardKey.arrowLeft: _textCursor.moveLeft,
        PhysicalKeyboardKey.arrowRight: _textCursor.moveRight,
      },
      inputCharAction: _textCursor.inputText,
    );

    _animationCursor = TextCursorAnimation(
      speed: Duration(milliseconds: 400),
      onBlink: context.update,
    );

    context.cursor = SystemMouseCursors.text;
    context.update();
  }

  @override
  void mouseDown(double x, double y) {
    if (selectedShape.rect.contains(Offset(x, y))) {
      _textCursor.changePosition(x);
      _animationCursor.touch();
      return;
    }

    _animationCursor.dispose();
    super.mouseDown(x, y);
  }

  @override
  void keyDown(KeyEvent keyEvent) {
    _keyboardActions.keyDown(keyEvent);
    _animationCursor.touch();
  }

  @override
  void paint(Canvas canvas) {
    context.paintStyle.paintSelectedText(selectedShape, canvas);
    super.paint(canvas);

    if (_animationCursor.isVisible) {
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
    return '${super.toString()} + Text Edit State';
  }

  final Offset _startPointer;
  late final TextCursor _textCursor;
  late final KeyboardActions _keyboardActions;
  late final TextCursorAnimation _animationCursor;
}
