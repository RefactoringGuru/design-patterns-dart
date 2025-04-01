import 'package:flutter/material.dart';

import '../states/selections/selection_state.dart';
import 'base_shape.dart';
import 'shape.dart';

class MarkerShape extends BaseShape {
  MarkerShape(double size) : super(0, 0, size, -1);

  @override
  Rect get rect => Rect.fromLTWH(x - width, y - width, width * 2, width * 2);

  @override
  void paint(Canvas canvas) => throw UnimplementedError();

  @override
  SelectionState<Shape> createSelectionState() => throw UnimplementedError();
}
