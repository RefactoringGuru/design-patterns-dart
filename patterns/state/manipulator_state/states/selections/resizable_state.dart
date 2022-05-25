import 'package:flutter/material.dart';

import 'selection_state.dart';

class ResizableState extends SelectionState {
  ResizableState({required super.selectedShape});

  @override
  void mouseMove(double x, double y) {
    super.mouseMove(x, y);

    final rect1 = Rect.fromLTWH(
      selectedShape.x - 5,
      selectedShape.y - 5,
      10,
      10,
    );
    if (rect1.contains(Offset(x, y))) {
      context.cursor = SystemMouseCursors.resizeUpLeft;
      context.update();
      return;
    }

    final rect2 = Rect.fromLTWH(
      selectedShape.x + selectedShape.width - 5,
      selectedShape.y - 5,
      10,
      10,
    );
    if (rect2.contains(Offset(x, y))) {
      context.cursor = SystemMouseCursors.resizeUpRight;
      context.update();
      return;
    }

    context.cursor = SystemMouseCursors.basic;
    context.update();
  }

  @override
  void paint(Canvas canvas) {
    super.paint(canvas);
    final xPlusWidth = selectedShape.x + selectedShape.width;
    final yPlusHeight = selectedShape.y + selectedShape.height;

    final point1 = Offset(selectedShape.x, selectedShape.y);
    final point2 = Offset(xPlusWidth, selectedShape.y);
    final point3 = Offset(xPlusWidth, yPlusHeight);
    final point4 = Offset(selectedShape.x, yPlusHeight);

    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    const radius = 5.0;
    canvas.drawCircle(point1, radius, paint1);
    canvas.drawCircle(point2, radius, paint1);
    canvas.drawCircle(point3, radius, paint1);
    canvas.drawCircle(point4, radius, paint1);

    final paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.cyanAccent;

    canvas.drawCircle(point1, radius, paint2);
    canvas.drawCircle(point2, radius, paint2);
    canvas.drawCircle(point3, radius, paint2);
    canvas.drawCircle(point4, radius, paint2);
  }

  @override
  String toString() {
    return 'Resizable State + ${super.toString()}';
  }
}
