import 'package:flutter/src/services/mouse_cursor.dart';

import '../../../shapes/circle_shape.dart';
import '../../_/corner_marker.dart';

class InnerRadiusMarkerState extends CornerMarker<CircleShape> {
  InnerRadiusMarkerState({required super.parentState});

  @override
  void mouseDragAction(double x, double y) {
    final selectedCircle = parentState.selectedShape;
    selectedCircle.innerRadius = selectedCircle.rect.right - x;
  }

  @override
  void updatePosition() {
    final selectedCircle = parentState.selectedShape;
    final y = selectedCircle.y + selectedCircle.height / 2;
    final x = selectedCircle.x + selectedCircle.width;
    markerShape.move(
      x - selectedCircle.innerRadius,
      y,
    );
  }

  @override
  MouseCursor get hoverCursor => SystemMouseCursors.resizeLeftRight;

  @override
  String toString() {
    return '${parentState.toString()} + Inner Radius Marker State';
  }
}
