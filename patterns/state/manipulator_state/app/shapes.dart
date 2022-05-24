import 'dart:collection';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../shapes/shape.dart';

class Shapes with IterableMixin<Shape> {
  final _shapes = <Shape>[];

  void add(Shape shape) {
    _shapes.add(shape);
    onChange._emit();
  }

  @override
  Iterator<Shape> get iterator => _shapes.iterator;

  final onChange = Event();

  Shape? findShapeByCoordinates(x, y) {
    for (final shape in _shapes) {
      final shapeRect = Rect.fromLTWH(
        shape.x,
        shape.y,
        shape.width,
        shape.height,
      );

      if (shapeRect.contains(Offset(x, y))) {
        return shape;
      }
    }

    return null;
  }
}

class Event extends ChangeNotifier {
  void _emit() => notifyListeners();
}
