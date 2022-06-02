import 'package:flutter/material.dart';

import '../states/selections/resizable_state.dart';
import '../states/selections/selection_state.dart';
import 'base_shape.dart';

class RectangleShape extends BaseShape {
  RectangleShape(super.x, super.y, super.width, super.height);

  @override
  SelectionState createSelectionState() {
    return ResizableState(selectedShape: this);
  }

  @override
  void paint(Canvas canvas) {
    canvas.drawRect(
      rect,
      Paint()..color = Colors.white,
    );
  }
}
