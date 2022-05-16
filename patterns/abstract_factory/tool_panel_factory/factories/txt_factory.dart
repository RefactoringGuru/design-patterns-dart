import 'dart:ui';

import '../mixin/icon_box_mixin.dart';
import '../pattern/tool_factory.dart';
import '../shapes/txt_shape.dart';
import '../pattern/shape.dart';

class TxtFactory extends FactoryTool with IconBoxMixin {
  @override
  Shape createShape(double x, double y, Color color) {
    return Txt(
      text: 'Text',
      fontSize: 100,
      x: x,
      y: y,
      color: color,
    );
  }
}
