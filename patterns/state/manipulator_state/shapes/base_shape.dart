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
  Rect get rect => Rect.fromLTWH(
        _width < 0 ? x + _width : x,
        _height < 0 ? y + _height : y,
        _width.abs(),
        _height.abs(),
      );

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
  void paint(Canvas canvas) {}

  double _x;
  double _y;
  double _width;
  double _height;
}
