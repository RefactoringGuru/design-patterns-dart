import 'dart:ui';

abstract class Shape {
  double get x => _x;

  double get y => _y;

  final Color color;

  Shape({
    required double x,
    required double y,
    required this.color,
  })  : _x = x,
        _y = y;

  void paint(Canvas can);

  double get width;

  double get height;

  void centerToFit() {
    _x -= width / 2;
    _y -= height / 2;
  }

  void translate(double x, double y) {
    _x += x;
    _y += y;
  }

  double _x;
  double _y;
}
