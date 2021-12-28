import 'dart:math';

import 'package:design_patterns_dart/text_canvas.dart';

import '../shapes/shape.dart';

class ShapeEngine {
  final List<Shape> shapes;
  final int width;
  final int height;

  ShapeEngine({
    required this.width,
    required this.height,
    required this.shapes,
  });

  String render() {
    final can = Canvas(width, height, lineStretch: 3);
    for (final Shape shape in shapes) {
      can
        ..translate = Point(shape.x, shape.y)
        ..penColor = shape.color;
      shape.draw(can);
    }
    return can.toString();
  }
}
