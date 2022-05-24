import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'resizable_state.dart';

class CircleInnerRadiusState extends ResizableState {
  CircleInnerRadiusState({required super.selectedShape});

  @override
  void mouseMove(double x, double y) {
    super.mouseMove(x, y);
  }

  @override
  void paint(Canvas canvas) {
    super.paint(canvas);
  }

  @override
  String toString() {
    return 'Selection State + Resizable State + Circle Inner Radius State';
  }
}
