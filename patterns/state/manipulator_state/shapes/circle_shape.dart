import 'package:flutter/material.dart';

import '../states/selections/circle_inner_radius_state.dart';
import '../states/selections/selection_state.dart';
import 'base_shape.dart';

class CircleShape extends BaseShape {
  CircleShape(super.x, super.y, super.width, super.height);

  @override
  SelectionState createSelectionState() {
    return CircleInnerRadiusState(selectedShape: this);
  }

  @override
  Rect get rect => Rect.fromLTWH(x, y, width, height);

  @override
  void paint(Canvas canvas) {
    final w = width / 2;
    final h = height / 2;
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addOval(rect)
      ..addOval(
        Rect.fromLTWH(
          x + w / 2,
          y + h / 2,
          w,
          h,
        ),
      );
    canvas.drawPath(
      path,
      Paint()..color = Colors.white,
    );
  }
}
