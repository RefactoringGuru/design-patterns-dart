import 'package:flutter/material.dart';

import '../../shapes/shape.dart';
import '../free_sate.dart';

class SelectionState extends FreeState {
  final Shape selectedShape;

  SelectionState({required this.selectedShape});

  @override
  void mouseDown(double x, double y) {
    final isShapeNotSelected = !trySelectAndStartMovingShape(x, y);

    if (isShapeNotSelected) {
      context.changeState(FreeState());
    }
  }

  @override
  void paint(Canvas canvas) {
    super.paint(canvas);
    canvas.drawRect(
      selectedShape.rect.deflate(1),
      Paint()
        ..color = Colors.cyanAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );
  }

  @override
  String toString() {
    return '${super.toString()} + Selection State';
  }
}
