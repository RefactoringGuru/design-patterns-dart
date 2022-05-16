import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../pattern/shape.dart';

class StarShape extends Shape {
  final double radius;

  StarShape({
    required this.radius,
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
    final path = Path()..addPolygon(_createStar(), true);
    can.drawPath(path, Paint()..color = color);
  }

  @override
  double get width => radius * 2;

  @override
  double get height => radius * 2;

  List<Offset> _createStar() {
    const alpha = (2 * pi) / 10;

    final starXY = radius;

    final points = <Offset>[];

    for (var i = 11; i != 0; i--) {
      var r = radius * (i % 2 + 1) / 2;
      var omega = alpha * i;
      points.add(Offset(
        (r * sin(omega)) + starXY,
        (r * cos(omega)) + starXY,
      ));
    }

    return points;
  }
}
