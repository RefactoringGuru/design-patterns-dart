import 'package:flutter/rendering.dart';

import '../../../shapes/marker_shape.dart';
import '../selection_state.dart';
import '../sub_states/child_state.dart';

class TopRightMarkerState extends ChildState {
  TopRightMarkerState({
    required SelectionState parentState,
  }) : super(
          parentState: parentState,
          hoverCursor: SystemMouseCursors.resizeUpRight,
          markerShape: MarkerShape(),
        );

  @override
  void mouseMoveAction(double x, double y) {
    final selectedShape = parentState.selectedShape;
    selectedShape.resize(
      x - selectedShape.x,
      selectedShape.height + selectedShape.y - y,
    );
    selectedShape.move(selectedShape.x, y);
  }

  @override
  void updatePosition() {
    markerShape.move(
      parentState.selectedShape.x + parentState.selectedShape.width,
      parentState.selectedShape.y,
    );
  }

  @override
  String toString() {
    return '${parentState.toString()} + Top Right Marker State';
  }
}
