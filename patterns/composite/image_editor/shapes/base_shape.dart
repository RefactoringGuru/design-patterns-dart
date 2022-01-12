import 'package:design_patterns_dart/text_canvas.dart';

import '../editor/image_editor.dart';
import 'shape.dart';

abstract class BaseShape implements Shape {
  int _x;
  int _y;
  final Color color;

  bool _selected = false;

  BaseShape(this._x, this._y, this.color);

  @override
  int get x => _x;

  @override
  int get y => _y;

  @override
  void move(int x, int y) {
    _x += x;
    _y += y;
  }

  @override
  void select() => _selected = true;

  @override
  void unSelect() => _selected = false;

  @override
  bool get isSelected => _selected;

  void enableSelectionStyle(Graphics graphics) {
    graphics.penColor = Color.white;
  }

  void disableSelectionStyle(Graphics graphics) {
    graphics.penColor = color;
  }

  @override
  void paint(Graphics graphics) {
    if (isSelected) {
      enableSelectionStyle(graphics);
    } else {
      disableSelectionStyle(graphics);
    }
  }
}
