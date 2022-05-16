import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../pattern/shape.dart';

class TriangleShape extends Shape {
  final double sideLength;

  TriangleShape({
    required this.sideLength,
    required double x,
    required double y,
    required Color color,
  }) : super(
          x: x,
          y: y,
          color: color,
        );

  @override
  void paint(Canvas can) {
    final path = Path()
      ..addPolygon(
        [
          Offset(0, height),
          Offset(width / 2, 0),
          Offset(width, height),
        ],
        true,
      );

    can.drawPath(
      path,
      Paint()
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke
        ..color = color
        ..strokeWidth = 5,
    );
  }

  @override
  double get width => sideLength;

  @override
  double get height => sideLength * sqrt(3) / 2;
}
