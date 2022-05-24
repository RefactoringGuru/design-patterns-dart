import 'package:flutter/material.dart';

import '../../pattern/manipulator_context.dart';
import '../../shapes/shape.dart';
import '../free_sate.dart';

class SelectionState extends ManipulationState {
  final Shape selectedShape;

  SelectionState({required this.selectedShape});

  @override
  void mouseDown(double x, double y) {
    context.changeState(FreeState());
  }

  @override
  void paint(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(
        selectedShape.x - 1,
        selectedShape.y - 1,
        selectedShape.width + 1,
        selectedShape.height + 1,
      ),
      Paint()
        ..color = Colors.cyanAccent
        ..style = PaintingStyle.stroke,
    );
  }
}
