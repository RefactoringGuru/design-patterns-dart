import 'dart:ui';

import 'shape.dart';

mixin Shapes {
  final shapes = <Shape>[];

  void paintShapes(Canvas canvas) {
    for (final shape in shapes.reversed) {
      shape.paint(canvas);
    }
  }

  Shape? _selectedShape;

  Shape? get selectedShape => _selectedShape;

  void select(double x, double y) {
    _selectedShape = findCircle(x, y);

    if (_selectedShape != null) {
      _xStart = _selectedShape!.x - x;
      _yStart = _selectedShape!.y - y;
    }
  }

  void unSelect() {
    _selectedShape = null;
  }

  void changeSize(double delta) {
    final currentSize = _selectedShape?.size;

    if (currentSize != null) {
      final newSize = currentSize - delta;
      if (newSize != _selectedShape!.size) {
        _selectedShape!.size = newSize;
      }
    }
  }

  void drag(double x, double y) {
    _selectedShape!.x = x + _xStart;
    _selectedShape!.y = y + _yStart;
  }

  var _xStart = 0.0;
  var _yStart = 0.0;

  Shape? findCircle(double x, double y) {
    for (final shape in shapes) {
      if (shape.isBounded(x, y)) {
        return shape;
      }
    }
  }
}
