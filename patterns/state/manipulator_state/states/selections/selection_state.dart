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
      Rect.fromLTWH(
        selectedShape.x + 1,
        selectedShape.y + 1,
        selectedShape.width - 2,
        selectedShape.height - 2,
      ),
      Paint()
        ..color = Colors.cyanAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );
  }

  @override
  String toString() {
    return 'Selection State + ${super.toString()}';
  }
}
