import 'package:flutter/material.dart';

import 'base_shape.dart';

class MarkerShape extends BaseShape {
  MarkerShape([super.x = 0, super.y = 0, super.width = 5, super.height = 5]);

  @override
  void paint(Canvas canvas) {
    final point1 = Offset(x, y);

    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    canvas.drawCircle(point1, width, paint1);

    final paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.cyanAccent;

    canvas.drawCircle(point1, width, paint2);
  }
}
