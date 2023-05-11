import 'dart:ui';

import '../mixin/icon_box_mixin.dart';
import '../pattern/property.dart';
import '../pattern/tool_factory.dart';
import '../pattern/shape.dart';
import '../shapes/triangle_shape.dart';

class TriangleFactory extends ToolFactory with IconBoxMixin {
  var _isFilled = false;
  var _sideLength = 120.0;

  @override
  Shape createShape(double x, double y, Color color) {
    return TriangleShape(
      sideLength: _sideLength,
      isFilled: _isFilled,
      x: x,
      y: y,
      color: color,
    );
  }

  @override
  Iterable<Property> get properties => [
        Property(
          name: 'sideLength',
          value: () => _sideLength,
          onChange: (val) {
            _sideLength = val;
          },
        ),
        Property(
          name: 'filled',
          value: () => _isFilled,
          onChange: (val) {
            _isFilled = val;
          },
        ),
      ];
}
