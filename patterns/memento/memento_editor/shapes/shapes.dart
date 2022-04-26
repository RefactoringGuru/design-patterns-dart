import 'dart:ui';
import 'selected_shape.dart';
import 'shape.dart';

mixin Shapes {
  final shapes = <Shape>[];

  SelectedShape? _selectedShape;

  SelectedShape? get selectedShape => _selectedShape;

  void select(double x, double y) {
    final shape = findShape(x, y);

    if (shape != null) {
      _selectedShape = SelectedShape(shape, shape.x - x, shape.y - y);
    } else {
      _selectedShape = null;
    }
  }

  void selectByIndex(int index) {
    if (index == -1) {
      return;
    }

    if (index <= shapes.length - 1) {
      _selectedShape = SelectedShape(shapes[index], 0, 0);
    }
  }

  void unSelect() {
    _selectedShape = null;
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
