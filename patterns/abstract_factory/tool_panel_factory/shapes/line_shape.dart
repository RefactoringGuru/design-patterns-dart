import 'dart:ui';

import 'package:flutter/material.dart';

import 'base_shape.dart';

class LineShape extends BaseShape {
  final double length;

  LineShape({
    required bool isMirror,
    required this.length,
    required double x,
    required double y,
    required Color color,
  }) : super(
          x: x,
          y: y,
          color: color,
        ) {
    if (isMirror) {
      point1 = Offset(0, length);
      point2 = Offset(length, 0);
    } else {
      point1 = Offset(0, 0);
      point2 = Offset(length, length);
    }
  }

  late final Offset point1;
  late final Offset point2;

  @override
  void paint(Canvas can) {
    can.drawLine(point1, point2, Paint()..color = color);
  }

  @override
  double get width => length;

  @override
  double get height => length;
}
