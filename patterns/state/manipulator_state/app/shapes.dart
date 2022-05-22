import 'dart:collection';

import '../shapes/shape.dart';

class Shapes with IterableMixin<Shape> {
  final _shapes = <Shape>[];

  void add(Shape shape) {
    _shapes.add(shape);
  }

  @override
  Iterator<Shape> get iterator => _shapes.iterator;
}
