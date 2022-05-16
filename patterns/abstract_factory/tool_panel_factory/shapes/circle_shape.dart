import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../pattern/shape.dart';

class CircleShape extends Shape {
  final double radius;

  CircleShape({
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
    final pos = width / 2;
    can.drawCircle(
      Offset(pos, pos),
      radius,
      Paint()..color = color,
    );
  }

  @override
  double get width => radius * 2;

  @override
  double get height => width;
}
