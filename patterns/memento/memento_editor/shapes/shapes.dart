import 'dart:ui';
import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import 'shape.dart';

mixin Shapes implements ClassicApp {
  final shapes = <Shape>[];

  ActiveShape? _activeShape;

  ActiveShape? get activeShape => _activeShape;

  void select(double x, double y) {
    final shape = findShape(x, y);

    if (shape != null) {
      _activeShape = ActiveShape(shape, shape.x - x, shape.y - y, repaint);
    } else {
      unSelect();
    }
  }

  void selectByIndex(int index) {
    if (index == -1) {
      return;
    }

    if (index <= shapes.length - 1) {
      _activeShape = ActiveShape(shapes[index], 0, 0, repaint);
    }
  }

  void unSelect() {
    if (_activeShape == null) {
      return;
    }

    _activeShape?.dispose();
    _activeShape = null;
  }

  Shape? findShape(double x, double y) {
    for (final shape in shapes.reversed) {
      if (shape.isBounded(x, y)) {
        return shape;
      }
    }

    return null;
  }

  void paintShapes(Canvas canvas) {
    for (final shape in shapes) {
      shape.paint(canvas);
    }
  }
}
