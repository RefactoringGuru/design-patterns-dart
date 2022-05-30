import 'package:flutter/src/services/mouse_cursor.dart';

import '../../shapes/text_shape.dart';
import 'resizable_state/corner_marker.dart';
import 'sub_states/parent_state.dart';

class TextResizeState extends ParentState<TextShape> {
  TextResizeState({required super.selectedShape}) {
    addMarkers([
      TextSizeMarkerState(parentState: this),
    ]);
  }

  @override
  String toString() {
    return '${super.toString()} + Text Resize State';
  }
}

class TextSizeMarkerState extends CornerMarker<TextShape> {
  TextSizeMarkerState({required super.parentState});

  @override
  void mouseDragAction(double x, double y) {
    final newHeight = y - selectedShape.y;
    selectedShape.resize(-1, newHeight);
  }

  @override
  void updatePosition() {
    final bottomCenter = selectedShape.rect.bottomCenter;
    markerShape.move(bottomCenter.dx, bottomCenter.dy);
  }

  @override
  MouseCursor get hoverCursor => SystemMouseCursors.resizeUpDown;

  @override
  String toString() {
    return '${parentState.toString()} + Text Size Marker State';
  }
}
