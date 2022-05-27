import 'package:flutter/rendering.dart';

import '../../../shapes/marker_shape.dart';
import '../selection_state.dart';
import '../sub_states/child_state.dart';

abstract class CornerMarker extends ChildState {
  CornerMarker({
    required SelectionState parentState,
  }) : super(
          parentState: parentState,
          shape: MarkerShape(),
        );

  @override
  MouseCursor get hoverCursor {
    final rect = parentState.selectedShape.rect;
    final corner = Offset(shape.x, shape.y);

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
