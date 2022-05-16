import 'dart:ui';

import '../mixin/icon_box_mixin.dart';
import '../pattern/tool_factory.dart';
import '../pattern/shape.dart';
import '../shapes/line_shape.dart';

class LineFactory extends FactoryTool with IconBoxMixin {
  @override
  Shape createShape(double x, double y, Color color) {
    return LineShape(
      length: 100,
      x: x,
      y: y,
      color: color,
    );
  }
}
