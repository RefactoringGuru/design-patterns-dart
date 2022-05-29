import 'package:flutter/material.dart';

import '../../shapes/circle_shape.dart';
import 'inner_radius/inner_radius_marker_state.dart';
import 'resizable_state.dart';

class InnerRadiusState extends ResizableState {
  InnerRadiusState({required super.selectedShape}) {
    addMarkers([
      InnerRadiusMarkerState(parentState: this),
    ]);
  }

  @override
  void paint(Canvas canvas) {
    canvas.save();
    canvas.translate(selectedShape.x, selectedShape.y);
    final y = selectedShape.height / 2;
    final p1 = Offset(
      selectedShape.width - (selectedShape as CircleShape).innerRadius,
      y,
    );
    canvas.drawLine(
      p1,
      Offset(selectedShape.width, y),
      Paint()
        ..color = Colors.cyanAccent
        ..strokeWidth = 1,
    );

    canvas.restore();
    super.paint(canvas);
  }

  @override
  String toString() {
    return '${super.toString()} + Inner Radius State';
  }
}
