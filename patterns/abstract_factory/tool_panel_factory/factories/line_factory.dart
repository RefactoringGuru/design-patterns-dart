import 'dart:ui';

import '../mixin/icon_box_mixin.dart';
import '../pattern/property.dart';
import '../pattern/tool_factory.dart';
import '../pattern/shape.dart';
import '../shapes/line_shape.dart';

class LineFactory extends ToolFactory with IconBoxMixin {
  var _isMirror = true;
  var _length = 100.0;

  @override
  Shape createShape(double x, double y, Color color) {
    return LineShape(
      length: _length,
      isMirror: _isMirror,
      x: x,
      y: y,
      color: color,
    );
  }

  @override
  Iterable<Property> get properties {
    return [
      Property(
        name: 'mirror',
        value: () => _isMirror,
        onChange: (val) {
          _isMirror = val;
        },
      ),
      Property(
        name: 'length',
        value: () => _length,
        onChange: (val) {
          _length = val;
        },
      ),
    ];
  }
}
