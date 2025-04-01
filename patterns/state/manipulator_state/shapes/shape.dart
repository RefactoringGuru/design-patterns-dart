import 'dart:ui';

import '../states/selections/selection_state.dart';

abstract class Shape {
  double get x;

  double get y;

  double get width;

  double get height;

  Rect get rect;

  void move(double x, double y);

  void resize(double width, double height);

  void paint(Canvas canvas);

  SelectionState createSelectionState();
}
