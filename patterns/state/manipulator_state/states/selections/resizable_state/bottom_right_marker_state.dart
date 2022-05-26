import 'package:flutter/rendering.dart';

import '../../../shapes/marker_shape.dart';
import '../selection_state.dart';
import '../sub_states/child_state.dart';

class BottomRightMarkerState extends ChildState {
  BottomRightMarkerState({
    required SelectionState parentState,
  }) : super(
          parentState: parentState,
          hoverCursor: SystemMouseCursors.resizeDownRight,
          markerShape: MarkerShape(),
        );

  @override
  void mouseMoveAction(double x, double y) {
    final selectedShape = parentState.selectedShape;
    selectedShape.resize(
      x-selectedShape.x,
      y - selectedShape.y,
    );

  }

  @override
  void updatePosition() {
    markerShape.move(
      parentState.selectedShape.x + parentState.selectedShape.width,
      parentState.selectedShape.y+ parentState.selectedShape.height,
    );
  }

  @override
  String toString() {
    return '${parentState.toString()} + Bottom Right Marker State';
  }
}
