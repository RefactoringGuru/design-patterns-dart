import 'package:flutter/material.dart';

import 'resizable_state.dart';

class CircleInnerRadiusState extends ResizableState {
  CircleInnerRadiusState({required super.selectedShape});

  @override
  void paint(Canvas canvas) {
    super.paint(canvas);
    canvas.save();
    canvas.translate(selectedShape.x, selectedShape.y);

    final p1 = Offset(selectedShape.width / 4 * 3, selectedShape.height / 2);
    canvas.drawLine(
      p1,
      Offset(selectedShape.width, selectedShape.height / 2),
      Paint()
        ..color = Colors.cyanAccent
        ..strokeWidth = 2,
    );

    canvas.drawCircle(
      p1,
      5,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      p1,
      5,
      Paint()
        ..strokeWidth = 2
        ..color = Colors.cyanAccent
        ..style = PaintingStyle.stroke,
    );

    canvas.restore();
  }

  @override
  String toString() {
    return '${super.toString()} + Circle Inner Radius State';
  }
}
