import 'package:flutter/rendering.dart';

import '../../../shapes/marker_shape.dart';
import '../selection_state.dart';
import '../sub_states/child_state.dart';

class TopLeftMarkerState extends ChildState {
  TopLeftMarkerState({
    required SelectionState parentState,
  }) : super(
          parentState: parentState,
          hoverCursor: SystemMouseCursors.resizeDownRight,
          markerShape: MarkerShape(),
        );

  @override
  void mouseMoveAction(double x, double y) {
    parentState.selectedShape.resize(
      parentState.selectedShape.width + parentState.selectedShape.x - x,
      parentState.selectedShape.height + parentState.selectedShape.y - y,
    );
    parentState.selectedShape.move(x, y);
  }

  @override
  void updatePosition() {
    markerShape.move(parentState.selectedShape.x, parentState.selectedShape.y);
  }

  @override
  String toString() {
    return '${parentState.toString()} + Top Left Marker State';
  }
}
