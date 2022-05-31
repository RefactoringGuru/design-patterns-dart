import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shapes/text_shape.dart';
import 'selection_state.dart';

class TextChangeState extends SelectionState<TextShape> {
  TextChangeState({required super.selectedShape});

  @override
  void mouseDown(double x, double y) {
    super.mouseDown(x, y);
    if (selectedShape.rect.contains(Offset(x, y))) {
    } else {}
  }

  @override
  void keyDown(KeyEvent keyEvent) {
    if ((keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) &&
        keyEvent.character != null) {
      print(keyEvent.character);
      selectedShape.text += keyEvent.character!;
      context.update();
    }
  }

  @override
  void paint(Canvas canvas) {
    canvas.drawRect(
      selectedShape.rect,
      Paint()..color = Colors.pink.withOpacity(0.3),
    );
    super.paint(canvas);
  }

  @override
  String toString() {
    return '${super.toString()} + Text Change State';
  }
}
