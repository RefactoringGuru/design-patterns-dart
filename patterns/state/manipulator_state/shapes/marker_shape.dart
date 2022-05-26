import 'package:flutter/material.dart';

import 'base_shape.dart';

class MarkerShape extends BaseShape {
  MarkerShape([super.x = 0, super.y = 0, super.width = 5, super.height = -1]);

  @override
  Rect get rect => Rect.fromLTWH(x - width, y - width, width * 2, width * 2);

  @override
  void paint(Canvas canvas) {
    final point = Offset(x, y);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    canvas.drawCircle(point, width, paint);

    final paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.cyanAccent;

    canvas.drawCircle(point, width, paint2);
  }
}
