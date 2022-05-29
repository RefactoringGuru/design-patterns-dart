import 'package:flutter/cupertino.dart';
import 'package:flutter/src/services/mouse_cursor.dart';

import '../../../shapes/circle_shape.dart';
import '../../../shapes/marker_shape.dart';
import '../sub_states/child_state.dart';
import '../sub_states/parent_state.dart';

class InnerRadiusMarkerState extends ChildState {
  InnerRadiusMarkerState({
    required ParentState parentState,
  }) : super(
          parentState: parentState,
          shape: MarkerShape(5),
        );

  @override
  void mouseDragAction(double x, double y) {
    final selectedCircle = parentState.selectedShape as CircleShape;
    selectedCircle.innerRadius = selectedCircle.rect.right - x;
  }

  @override
  void updatePosition() {
    final selectedCircle = parentState.selectedShape as CircleShape;
    final y = selectedCircle.y + selectedCircle.height / 2;
    final x = selectedCircle.x + selectedCircle.width;
    shape.move(
      x - selectedCircle.innerRadius,
      y,
    );
  }

  @override
  MouseCursor get hoverCursor => SystemMouseCursors.resizeLeftRight;
}
