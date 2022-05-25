import 'package:flutter/material.dart';

import 'children/marker_state.dart';
import 'selection_state.dart';

class ResizableState extends SelectionState {
  late final List<MarkerState> _markers;

  ResizableState({required super.selectedShape}) {
    _markers = [
      MarkerState.topLeft(this),
      MarkerState.topRight(this),
      MarkerState.bottomRight(this),
      MarkerState.bottomLeft(this),
    ];
  }

  @override
  void mouseDown(double x, double y) {
    for (final marker in _markers) {
      marker.mouseDown(x, y);
      if (marker.isDown) {
        return;
      }
    }

    super.mouseDown(x, y);
  }

  @override
  void mouseMove(double x, double y) {
    super.mouseMove(x, y);

    for (final marker in _markers) {
      marker.mouseMove(x, y);
      if (marker.isHover) {
        return;
      }
    }
  }

  @override
  void mouseUp() {
    for (final marker in _markers) {
      marker.mouseUp();
    }
  }

  @override
  void paint(Canvas canvas) {
    super.paint(canvas);

    for (final marker in _markers) {
      marker.render(canvas);
    }
  }

  @override
  String toString() {
    return '${super.toString()} + Resizable State';
  }
}
