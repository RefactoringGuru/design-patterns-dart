import 'dart:ui';
import 'selected_shape.dart';
import 'shape.dart';

mixin Shapes {
  final shapes = <Shape>[];

  SelectedShape? _selected;

  SelectedShape? get selected => _selected;

  void select(double x, double y) {
    final shape = findShape(x, y);

    if (shape != null) {
      _selected = SelectedShape(shape, shape.x - x, shape.y - y);
    } else {
      _selected = null;
    }
  }

  void unSelect() {
    _selected = null;
  }

  Shape? findShape(double x, double y) {
    for (final shape in shapes) {
      if (shape.isBounded(x, y)) {
        return shape;
      }
    }

    return null;
  }

  void paintShapes(Canvas canvas) {
    for (final shape in shapes.reversed) {
      shape.paint(canvas);
    }
  }
}
