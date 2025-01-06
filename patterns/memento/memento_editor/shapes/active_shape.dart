part of 'shape.dart';

class ActiveShape {
  final Shape shape;
  final void Function() repaint;

  ActiveShape(this.shape, this._xStart, this._yStart, this.repaint) {
    repaint();
  }

  void changeSize(double delta) {
    final currentSize = shape.size;
    var newSize = currentSize - delta;

    if (newSize == shape.size) {
      return;
    }

    if (newSize < 10) {
      newSize = 10;
    } else if (newSize > 200) {
      newSize = 200;
    }

    shape._size = newSize;
    repaint();
  }

  final double _xStart;
  final double _yStart;

  void dragTo(double x, double y) {
    shape._x = x + _xStart;
    shape._y = y + _yStart;
    repaint();
  }

  void changeColor(Color newColor) {
    if (shape.color == newColor) {
      return;
    }

    shape._color = newColor;
    repaint();
  }

  void paintSelectionBox(Canvas canvas) {
    final x = (shape.x - shape.size).roundToDouble() - 1.5;
    final y = (shape.y - shape.size).roundToDouble() - 1.5;
    canvas.drawRect(
      Rect.fromLTWH(x, y, shape.size * 2 + 3, shape.size * 2 + 3),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Color(0xff26e6ff),
    );
  }

  void dispose() {
    repaint();
  }
}
