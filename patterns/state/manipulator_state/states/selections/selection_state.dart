import 'package:flutter/material.dart';

import '../../shapes/shape.dart';
import '../free_sate.dart';

class SelectionState<TShape extends Shape> extends FreeState {
  final TShape selectedShape;

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
    context.paintStyle.paintSelection(canvas, selectedShape);
  }

  @override
  String toString() {
    return '${super.toString()} + Selection State';
  }
}
