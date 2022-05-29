import 'package:flutter/rendering.dart';

import '../../../shapes/marker_shape.dart';
import '../sub_states/child_state.dart';
import '../sub_states/parent_state.dart';

abstract class CornerMarker extends ChildState {
  CornerMarker({
    required ParentState parentState,
  }) : super(
          parentState: parentState,
          markerShape: MarkerShape(5),
        );

  @override
  MouseCursor get hoverCursor {
    final rect = parentState.selectedShape.rect;
    final corner = Offset(markerShape.x, markerShape.y);

    if (corner == rect.topLeft) {
      return SystemMouseCursors.resizeUpLeft;
    } else if (corner == rect.topRight) {
      return SystemMouseCursors.resizeUpRight;
    } else if (corner == rect.bottomLeft) {
      return SystemMouseCursors.resizeDownLeft;
    } else if (corner == rect.bottomRight) {
      return SystemMouseCursors.resizeDownRight;
    }

    return SystemMouseCursors.move;
  }
}
