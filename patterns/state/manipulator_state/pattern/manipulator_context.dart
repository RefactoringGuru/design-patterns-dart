import 'dart:ui';

import 'manipulation_state.dart';

class ManipulatorContext {
  final ManipulationState initState;

  ManipulatorContext({required this.initState});

  void mouseMove(double x, double y) {}

  void mouseDown(double x, y) {}

  void mouseUp() {}

  void keyDown(String key) {}

  void paint(Canvas canvas) {}
}
