import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'base_shape.dart';

class StarShape extends BaseShape {
  final double radius;
  final bool isFilled;

  StarShape({
    required this.radius,
    required this.isFilled,
    required double x,
    required double y,
    required Color color,
  }) : super(
          x: x,
          y: y,
          color: color,
        ) {
    _starPath = Path()..addPolygon(_createStar(), true);
  }

  late final Path _starPath;

  @override
  void paint(Canvas can) {
    can.drawPath(
      _starPath,
      Paint()
        ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
        ..color = color,
    );
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
