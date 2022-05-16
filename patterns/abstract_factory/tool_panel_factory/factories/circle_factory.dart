import 'dart:ui';

import '../mixin/icon_box_mixin.dart';
import '../pattern/tool_factory.dart';
import '../shapes/circle_shape.dart';
import '../pattern/shape.dart';

class CircleFactory extends ToolFactory with IconBoxMixin {
  @override
  Shape createShape(double x, double y, Color color) {
    return CircleShape(
      radius: 50,
      x: x,
      y: y,
      color: color,
    );
  }
}
