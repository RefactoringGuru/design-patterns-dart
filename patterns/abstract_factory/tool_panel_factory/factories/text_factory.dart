import 'dart:ui';

import '../mixin/icon_box_mixin.dart';
import '../pattern/property.dart';
import '../pattern/tool_factory.dart';
import '../shapes/text_shape.dart';
import '../pattern/shape.dart';

class TextFactory extends ToolFactory with IconBoxMixin {
  var _text = 'Text';
  var _fontSize = 50.0;

  @override
  Shape createShape(double x, double y, Color color) {
    return TextShape(
      text: _text,
      fontSize: _fontSize,
      x: x,
      y: y,
      color: color,
    );
  }

  @override
  Iterable<Property> get properties {
    return [
      Property(
        name: 'text',
        value: () => _text,
        onChange: (value) {
          _text = value;
        },
      ),
      Property(
        name: 'fontSize',
        value: () => _fontSize,
        onChange: (value) {
          _fontSize = value;
        },
      ),
    ];
  }
}
