import 'dart:ui';

import 'shape.dart';

class SelectedShape {
  final Shape shape;

  SelectedShape(this.shape, this._xStart, this._yStart);

  void changeSize(double delta) {
    final currentSize = shape.size;
    final newSize = currentSize - delta;

    if (newSize != shape.size) {
      shape.size = newSize;
    }
  }

  final double _xStart;
  final double _yStart;

  void dragTo(double x, double y) {
    shape.x = x + _xStart;
    shape.y = y + _yStart;
  }

  void paintSelectFrame(Canvas canvas) {
    final x = (shape.x - shape.size).roundToDouble() - 1.5;
    final y = (shape.y - shape.size).roundToDouble() - 1.5;
    canvas.drawRect(
      Rect.fromLTWH(x, y, shape.size * 2 + 3, shape.size * 2 + 3),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Color(0xff26e6ff),
    );
  }
}
