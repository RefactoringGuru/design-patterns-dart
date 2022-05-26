library manipulator;

import 'package:flutter/material.dart';
import '../app/shapes.dart';

part 'manipulation_state.dart';
part '../app/base_manipulation_context.dart';

abstract class ManipulationContext {
  Shapes get shapes;

  MouseCursor get cursor;

  set cursor(MouseCursor cursor);

  ManipulationState get state;

  Event get onStateChange;

  Event get onUpdate;

  void changeState(ManipulationState newState);

  void update();

  void mouseMove(double x, double y);

  void mouseDown(double x, double y);

  void mouseUp();

  void keyDown(String key);

  void paint(Canvas canvas);
}
