// ignore_for_file: prefer_final_fields

import 'dart:ui';

part 'active_shape.dart';

class Shape {
  double _x;

  double get x => _x;

  double _y;

  double get y => _y;

  Color _color;

  Color get color => _color;

  double _size;

  double get size => _size;

  Shape(
    this._x,
    this._y, [
    this._color = const Color(0xFFFFFFFF),
    this._size = 60.0,
  ]);

  static final _paintStroke = Paint()
    ..style = PaintingStyle.stroke
    ..color = Color(0xFFD81B60)
    ..strokeWidth = 2;

  void paint(Canvas canvas) {
    final paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final offset = Offset(x, y);
    canvas.drawCircle(offset, _size, paintFill);
    canvas.drawCircle(offset, _size, _paintStroke);
  }

  bool isBounded(double x, double y) {
    return ((x - this.x) * (x - this.x) + (y - this.y) * (y - this.y) <=
        _size * _size);
  }
}
