import 'package:flutter/material.dart';

import '../../shapes/circle_shape.dart';
import 'inner_radius_markers/inner_radius_marker_state.dart';
import 'resizable_state.dart';

class InnerRadiusState extends ResizableState<CircleShape> {
  InnerRadiusState({required super.selectedShape}) {
    addChildren([
      InnerRadiusMarkerState(parentState: this),
    ]);
  }

  @override
  void paint(Canvas canvas) {
    context.paintStyle.paintRadiusLine(selectedShape, canvas);
    super.paint(canvas);
  }

  @override
  String toString() {
    return '${super.toString()} + Inner Radius State';
  }
}
