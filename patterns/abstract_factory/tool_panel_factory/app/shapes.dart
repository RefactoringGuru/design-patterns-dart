import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../pattern/shape.dart';

class Shapes with IterableMixin<Shape> {
  final List<Shape> _shapes;

  Shapes(this._shapes);

  void add(Shape shape) {
    _shapes.add(shape);
    onAddShapeEvent._emit();
  }

  @override
  Iterator<Shape> get iterator => _shapes.iterator;

  final onAddShapeEvent = Event();
}

class Event extends ChangeNotifier {
  void _emit() => notifyListeners();
}
