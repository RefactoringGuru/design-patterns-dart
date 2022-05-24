import 'package:flutter/material.dart';

import '../../pattern/manipulator_context.dart';
import '../../shapes/shape.dart';

mixin HoverStateMixin implements ManipulationState {
  @override
  void mouseMove(double x, double y) {
    final newHover = context.shapes.findShapeByCoordinates(x, y);

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

  void onHover(){}

  void onMouseLeave(){}

  Shape? _hoverShape;

  @override
  void paint(Canvas canvas) {
    if (_hoverShape == null) {
      return;
    }

    canvas.drawRect(
      Rect.fromLTWH(
        _hoverShape!.x+2,
        _hoverShape!.y+2,
        _hoverShape!.width-4,
        _hoverShape!.height-4,
      ),
      Paint()
        ..color = Colors.cyanAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0,
    );
  }
}
