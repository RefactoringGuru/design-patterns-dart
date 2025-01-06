import 'package:flutter/material.dart';

import '../pattern/shape.dart';

abstract class BaseShape implements Shape {
  @override
  double get x => _x;

  @override
  double get y => _y;

  @override
  final Color color;

  BaseShape({
    required double x,
    required double y,
    required this.color,
  })  : _x = x,
        _y = y;

  @override
  void centerToFit() {
    _x -= width / 2;
    _y -= height / 2;
  }

  double _x;
  double _y;
}
