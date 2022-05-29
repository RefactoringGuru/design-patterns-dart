import 'package:flutter/material.dart';

import '../../shapes/shape.dart';
import '../free_sate.dart';

class SelectionState<T extends Shape> extends FreeState {
  final T selectedShape;

  SelectionState({required this.selectedShape});

  @override
  void mouseDown(double x, double y) {
    final isShapeNotSelected = !tryToSelectAndStartMovingShape(x, y);

    if (isShapeNotSelected) {
      context.changeState(FreeState());
    }
  }

  @override
  void paint(Canvas canvas) {
    super.paint(canvas);
    context.paintStyle.paintHover(canvas, selectedShape);
  }

  @override
  String toString() {
    return '${super.toString()} + Selection State';
  }
}
