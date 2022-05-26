import 'package:flutter/material.dart';

import '../states/selections/selection_state.dart';
import 'shape.dart';

class BaseShape implements Shape {
  BaseShape(double x, double y, double width, double height)
      : _x = x,
        _y = y,
        _width = width,
        _height = height;

  @override
  double get x => _x;

  @override
  double get y => _y;

  @override
  double get height => _height;

  @override
  double get width => _width;

  @override
  Rect get rect => Rect.fromLTWH(x, y, width, height);

  @override
  SelectionState createSelectionState() {
    return SelectionState(selectedShape: this);
  }

  @override
  void move(double x, double y) {
    _x = x;
    _y = y;
  }

  @override
  void resize(double width, double height) {
    _width = width;
    _height = height;
  }

  @override
  void paint(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(
        _x,
        _y,
        _width,
        _height,
      ),
      Paint()..color = Colors.white,
    );
  }

  double _x;
  double _y;
  double _width;
  double _height;
}
