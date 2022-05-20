import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'base_shape.dart';

class TriangleShape extends BaseShape {
  final double sideLength;
  final bool isFilled;

  TriangleShape({
    required this.sideLength,
    required this.isFilled,
    required double x,
    required double y,
    required Color color,
  }) : super(x: x, y: y, color: color) {
    _trianglePath = Path()
      ..addPolygon(
        [
          Offset(0, height),
          Offset(width / 2, 0),
          Offset(width, height),
        ],
        true,
      );
  }

  late final Path _trianglePath;

  @override
  void paint(Canvas can) {
    can.drawPath(
        _trianglePath,
        Paint()
          ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
          ..color = color);
  }

  @override
  double get width => sideLength;

  @override
  double get height => sideLength * sqrt(3) / 2;
}
