import 'dart:math';
import 'dart:ui';

import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';

class Circle {
  double x;
  double y;
  var color = Color(0xFFFFFFFF);
  var size = 60.0;

  Circle(this.x, this.y);

  static final paintStroke = Paint()
    ..style = PaintingStyle.stroke
    ..color = Color(0xFFD81B60)
    ..strokeWidth = 2;

  void paint(Canvas canvas) {
    final paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawCircle(Offset(x, y), size, paintFill);
    canvas.drawCircle(Offset(x, y), size, paintStroke);
  }

  bool isBounded(double x, double y) {
    return ((x - this.x) * (x - this.x) + (y - this.y) * (y - this.y) <=
        size * size);
  }
}

class Editor extends ClassicApp {
  final shapes = <Circle>[];

  Editor() {
    const positionRadius = 300.0;
    for (var i = 0; i < 7; i++) {
      final x = 60 + positionRadius + cos(i / 1.15) * positionRadius;
      final y = 60 + positionRadius + sin(i / 1.15) * positionRadius;
      shapes.add(Circle(x, y));
    }
  }

  var isMouseDown = false;

  var d = 60.0;

  Circle? selectedCircle;

  @override
  void onMouseDown(double x, double y) {
    isMouseDown = true;
    for (final circle in shapes) {
      if (circle.isBounded(x, y)) {
        selectedCircle = circle;
        xStart = circle.x - x;
        yStart = circle.y - y;
        repaint();
        return;
      }
    }
    selectedCircle = null;
    repaint();
  }

  var xStart = 0.0;
  var yStart = 0.0;

  @override
  void onMouseMove(double x, double y) {
    if (isMouseDown && selectedCircle != null) {
      selectedCircle!.x = x + xStart;
      selectedCircle!.y = y + yStart;
      repaint();
    }
  }

  @override
  void onPointerWheel(double deltaX, double deltaY) {
    if (selectedCircle != null) {
      selectedCircle!.size -= deltaY / 5;
      repaint();
    }
  }

  @override
  void onMouseUp() {
    isMouseDown = false;
  }

  @override
  void onPaint(Canvas canvas, Size canvasSize) {
    canvas.drawRect(
      Offset.zero & canvasSize,
      Paint()..color = Color(0xff404040),
    );

    for (final circle in shapes.reversed) {
      circle.paint(canvas);
    }

    if (selectedCircle != null) {
      final circleSize = selectedCircle!.size;
      final x = (selectedCircle!.x - circleSize).roundToDouble() - 1.5;
      final y = (selectedCircle!.y - circleSize).roundToDouble() - 1.5;
      canvas.drawRect(
        Rect.fromLTWH(x, y, circleSize * 2 + 3, circleSize * 2 + 3),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Color(0xff26e6ff),
      );
    }
  }
}
