import 'dart:ui';

abstract class Shape {
  double get x;

  double get y;

  double get width;

  double get height;

  Color get color;

  void paint(Canvas can);

  void centerToFit();
}
