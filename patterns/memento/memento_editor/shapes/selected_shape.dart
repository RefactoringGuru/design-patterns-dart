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
}
