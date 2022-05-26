import 'package:flutter/rendering.dart';

import '../../../shapes/marker_shape.dart';
import '../selection_state.dart';
import '../sub_states/child_state.dart';

class BottomLeftMarkerState extends ChildState {
  BottomLeftMarkerState({
    required SelectionState parentState,
  }) : super(
          parentState: parentState,
          hoverCursor: SystemMouseCursors.resizeDownLeft,
          markerShape: MarkerShape(),
        );

  @override
  void mouseMoveAction(double x, double y) {
    final selectedShape = parentState.selectedShape;
    selectedShape.resize(
      selectedShape.width +selectedShape.x - x,
      y - selectedShape.y,
    );
    selectedShape.move(x, selectedShape.y);
  }

  @override
  void updatePosition() {
    markerShape.move(
      parentState.selectedShape.x,
      parentState.selectedShape.y + parentState.selectedShape.height,
    );
  }
  @override
  String toString() {
    return '${parentState.toString()} + Bottom Left Marker State';
  }
}
