import 'dart:ui';

import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import '../shapes/shapes.dart';

mixin Manipulator implements ClassicApp, Shapes {
  void paintSelectFrame(Canvas canvas) {
    if (selectedShape != null) {
      final shapeSize = selectedShape!.size;
      final x = (selectedShape!.x - shapeSize).roundToDouble() - 1.5;
      final y = (selectedShape!.y - shapeSize).roundToDouble() - 1.5;
      canvas.drawRect(
        Rect.fromLTWH(x, y, shapeSize * 2 + 3, shapeSize * 2 + 3),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Color(0xff26e6ff),
      );
    }
  }

  var _isMouseDown = false;

  @override
  void onMouseDown(double x, double y) {
    _isMouseDown = true;
    final currSelection = selectedShape;

    select(x, y);

    if (currSelection == selectedShape) {
      return;
    }

    if (selectedShape == null) {
      unSelect();
    }

    repaint();
  }

  @override
  void onMouseMove(double x, double y) {
    if (_isMouseDown && selectedShape != null) {
      drag(x, y);
      repaint();
    }
  }

  @override
  void onPointerWheel(double deltaX, double deltaY) {
    if (selectedShape != null) {
      changeSize(deltaY / 5);
      repaint();
    }
  }

  @override
  void onMouseUp() {
    _isMouseDown = false;
  }
}
