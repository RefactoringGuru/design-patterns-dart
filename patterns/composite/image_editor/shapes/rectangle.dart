import 'dart:math';

import 'package:design_patterns_dart/text_canvas.dart';

import '../editor/image_editor.dart';
import 'base_shape.dart';

class Rectangle extends BaseShape {
  @override
  final int width;

  @override
  final int height;

  Rectangle(int x, int y, this.width, this.height, Color color)
      : super(x, y, color);

  @override
  void paint(Graphics graphics) {
    super.paint(graphics);
    graphics
      ..translate = Point(x - 1, y - 1)
      ..rectangle(width - 2, height - 1);
  }
}
