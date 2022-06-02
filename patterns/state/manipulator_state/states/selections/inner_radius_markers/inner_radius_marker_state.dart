import 'package:flutter/src/services/mouse_cursor.dart';

import '../../../shapes/circle_shape.dart';
import '../../_/marker.dart';

class InnerRadiusMarkerState extends Marker<CircleShape> {
  InnerRadiusMarkerState({required super.parentState});

  @override
  void mouseDragAction(double x, double y) {
    selectedShape.innerRadius = selectedShape.rect.right - x;
  }

  @override
  void updatePosition() {
    final y = selectedShape.y + selectedShape.height / 2;
    final x = selectedShape.x + selectedShape.width;

    markerShape.move(
      x - selectedShape.innerRadius,
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
