import 'dart:ui';

import '../mixin/icon_box_mixin.dart';
import '../pattern/property.dart';
import '../pattern/tool_factory.dart';
import '../pattern/shape.dart';
import '../shapes/star_shape.dart';

class StarFactory extends ToolFactory with IconBoxMixin {
  var _radius = 80.0;
  var _isFilled = false;

  @override
  Shape createShape(double x, double y, Color color) {
    return StarShape(
      radius: _radius,
      isFilled: _isFilled,
      x: x,
      y: y,
      color: color,
    );
  }

  @override
  Iterable<Property> get properties {
    return [
      Property(
        name: 'radius',
        value: () => _radius,
        onChange: (val) {
          _radius = val;
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
}
