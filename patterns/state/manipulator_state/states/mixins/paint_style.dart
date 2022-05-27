import 'dart:ui';

import 'package:flutter/material.dart';

import '../../shapes/shape.dart';

class PaintStyle {
  PaintStyle(this.color);

  final Color color;

  void paintHover(Canvas canvas, Shape shape) {
    canvas.drawRect(
      shape.rect.deflate(1),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );
  }

  void paintMarker(Canvas canvas, Shape shape) {
    final point = Offset(shape.x, shape.y);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    canvas.drawCircle(point, shape.width, paint);

    final paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = color;

    canvas.drawCircle(point, shape.width, paint2);
  }
}
