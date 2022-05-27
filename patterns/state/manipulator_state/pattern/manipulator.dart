library manipulator;

import 'package:flutter/material.dart';
import '../app/shapes.dart';
import '../states/mixins/paint_style.dart';

part 'manipulation_state.dart';
part '../app/base_manipulationt.dart';

abstract class Manipulator {
  ManipulationState get state;

  Shapes get shapes;

  MouseCursor get cursor;

  set cursor(MouseCursor cursor);

  PaintStyle get paintStyle;

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
