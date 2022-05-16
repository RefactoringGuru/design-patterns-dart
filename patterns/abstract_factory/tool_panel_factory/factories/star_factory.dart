import 'dart:ui';

import '../mixin/icon_box_mixin.dart';
import '../pattern/tool_factory.dart';
import '../pattern/shape.dart';
import '../shapes/star_shape.dart';

class StarFactory extends ToolFactory with IconBoxMixin {
  @override
  Shape createShape(double x, double y, Color color) {
    return StarShape(
      radius: 80,
      x: x,
      y: y,
      color: color,
    );
  }
}
