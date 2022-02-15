import 'dart:ui';

class Shape {
  double x;
  double y;
  Color color;
  double _size;

  double get size => _size;

  set size(double newSize) {
    if (newSize < 10) {
      newSize = 10;
    } else if (newSize > 200) {
      newSize = 200;
    }
    _size = newSize;
  }

  Shape(
    this.x,
    this.y, [
    this.color = const Color(0xFFFFFFFF),
    this._size = 60.0,
  ]);

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
