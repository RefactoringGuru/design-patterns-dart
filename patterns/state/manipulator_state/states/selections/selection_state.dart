import 'package:flutter/material.dart';

import '../../pattern/manipulator_context.dart';
import '../../shapes/shape.dart';
import '../free_sate.dart';
import '../specific_actions_mixin.dart';

class SelectionState extends ManipulationState with SpecificActionsMixin {
  final Shape selectedShape;

  SelectionState({required this.selectedShape});

  @override
  void mouseDown(double x, double y) {
    final isNotShapeSelected = !trySelectShape(x, y);

    if (isNotShapeSelected) {
      context.changeState(FreeState());
    }
  }

  @override
  void paint(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(
        selectedShape.x-1,
        selectedShape.y-1,
        selectedShape.width+2,
        selectedShape.height+2,
      ),
      Paint()
        ..color = Colors.cyanAccent
        ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0,
    );
  }
}
