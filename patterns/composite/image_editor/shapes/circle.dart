import 'dart:math';

import 'package:design_patterns_dart/text_canvas.dart';

import '../editor/image_editor.dart';
import 'base_shape.dart';

class Circle extends BaseShape {
  final int radius;

  Circle(int x, int y, this.radius, Color color) : super(x, y, color);

  @override
  int get width => radius * 2;

  @override
  int get height => radius * 2;

  @override
  void paint(Graphics graphics) {
    super.paint(graphics);
    graphics
      ..translate = Point(x + radius, y + radius)
      ..circle(radius);
  }
}
