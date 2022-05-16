import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../pattern/shape.dart';

class LineShape extends Shape {
  final double length;

  LineShape({
    required this.length,
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
    can.drawLine(
      Offset(0, length),
      Offset(length, 0),
      Paint()
        ..color = color
        ..strokeWidth = 3,
    );
  }

  @override
  double get width => length;

  @override
  double get height => length;
}
