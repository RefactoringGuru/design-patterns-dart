import 'dart:collection';

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
}

class Event extends ChangeNotifier {
  void _emit() => notifyListeners();
}
