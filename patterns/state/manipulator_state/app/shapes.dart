import 'dart:collection';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../shapes/shape.dart';

class Shapes with IterableMixin<Shape> {
  final List<Shape> _shapes;

  Shapes(List<Shape> shapes) : _shapes = shapes;

  void add(Shape shape) {
    _shapes.add(shape);
    onChange._emit();
  }

  @override
  Iterator<Shape> get iterator => _shapes.iterator;

  final onChange = Event();

  Shape? findShapeByCoordinates(x, y) {
    for (final shape in _shapes.reversed) {
      if (shape.rect.contains(Offset(x, y))) {
        return shape;
      }
    }

    return null;
  }
}

class Event extends ChangeNotifier {
  void _emit() => notifyListeners();
}
