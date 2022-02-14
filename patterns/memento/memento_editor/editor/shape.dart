import 'dart:ui';

class Shape {
  double x;
  double y;
  var color = Color(0xFFFFFFFF);
  var _size = 60.0;

  double get size => _size;

  set size(double newSize) {
    if (newSize < 10) {
      newSize = 10;
    } else if (newSize > 200) {
      newSize = 200;
    }
    _size = newSize;
  }

  Shape(this.x, this.y);

  static final paintStroke = Paint()
    ..style = PaintingStyle.stroke
    ..color = Color(0xFFD81B60)
    ..strokeWidth = 2;

  void paint(Canvas canvas) {
    final paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawCircle(Offset(x, y), _size, paintFill);
    canvas.drawCircle(Offset(x, y), _size, paintStroke);
  }

  bool isBounded(double x, double y) {
    return ((x - this.x) * (x - this.x) + (y - this.y) * (y - this.y) <=
        _size * _size);
  }
}
