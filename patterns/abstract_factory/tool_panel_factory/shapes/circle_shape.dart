import 'package:flutter/material.dart';

import 'base_shape.dart';

class CircleShape extends BaseShape {
  final double radius;
  final bool isFilled;

  CircleShape({
    required this.radius,
    required this.isFilled,
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
      radius - 2,
      Paint()
        ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
        ..color = color,
    );
  }

  @override
  double get width => radius * 2;

  @override
  double get height => width;
}
