import 'package:flutter/services.dart';

import '../../../shapes/text_shape.dart';
import '../../_/corner_marker.dart';

class TextSizeMarkerState extends Marker<TextShape> {
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
