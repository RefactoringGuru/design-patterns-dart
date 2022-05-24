import 'package:flutter/material.dart';

import '../pattern/manipulator_context.dart';
import 'selections/selection_state.dart';
import '../shapes/shape.dart';

mixin SpecificActionsMixin implements ManipulationState {
  bool trySelectShape(double x, double y) {
    final shape = context.shapes.shapeFromCoordinate(x, y);

    if (shape == null) {
      return false;
    }

    if (context.state is SelectionState &&
        (context.state as SelectionState).selectedShape == shape) {
      return true;
    }

    context.changeState(
      shape.createSelectionState(),
    );

    context.update();
    return true;
  }

  @override
  void mouseMove(double x, double y) {
    final newHover = context.shapes.shapeFromCoordinate(x, y);

    if (newHover == _hoverShape) {
      return;
    }

    _hoverShape = newHover;
    context.update();
  }

  Shape? _hoverShape;

  @override
  void paint(Canvas canvas) {
    if (_hoverShape == null) {
      return;
    }

    canvas.drawRect(
      Rect.fromLTWH(
        _hoverShape!.x - 1,
        _hoverShape!.y - 1,
        _hoverShape!.width + 2,
        _hoverShape!.height + 2,
      ),
      Paint()
        ..color = Colors.cyanAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );
  }
}
