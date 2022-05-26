import 'package:flutter/rendering.dart';

import '../../../pattern/manipulation_context.dart';
import '../../../shapes/marker_shape.dart';
import 'child_state.dart';

class TopRightMarkerState extends ChildState {
  TopRightMarkerState({
    required ManipulationState parentState,
  }) : super(
          parentState: parentState,
          hoverCursor: SystemMouseCursors.resizeDownRight,
          markerShape: MarkerShape(),
        );

  @override
  void mouseMoveAction(double x, double y) {

  }

  @override
  void updatePosition() {

  }
}
