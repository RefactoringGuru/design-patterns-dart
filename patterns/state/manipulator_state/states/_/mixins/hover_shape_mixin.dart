import 'package:flutter/material.dart';

import '../../../pattern/manipulator.dart';
import '../../../shapes/shape.dart';

mixin HoverShapeMixin implements ManipulationState {
  Shape? findShapeByCoordinates(double x, double y) {
    return context.shapes.findShapeByCoordinates(x, y);
  }

  Shape? get hoverShape => _hoverShape;

  bool get isHover => _hoverShape != null;

  @override
  void mouseMove(double x, double y) {
    final newHover = findShapeByCoordinates(x, y);

    if (newHover == _hoverShape) {
      return;
    }

    _hoverShape = newHover;

    if (newHover == null) {
      onMouseLeave();
    } else {
      onHover();
    }

    context.update();
  }

  void onHover() {}

  void onMouseLeave() {}

  @override
  void paint(Canvas canvas) {
    if (_hoverShape == null) {
      return;
    }

    context.paintStyle.paintHover(canvas, _hoverShape!);
  }

  Shape? _hoverShape;
}
