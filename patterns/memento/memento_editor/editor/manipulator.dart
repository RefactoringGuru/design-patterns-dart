import 'dart:ui';

import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import '../shapes/shapes.dart';

mixin Manipulator implements ClassicApp, Shapes {
  void paintSelectFrame(Canvas canvas) {
    if (selected != null) {
      final shapeSize = selected!.shape.size;
      final x = (selected!.shape.x - shapeSize).roundToDouble() - 1.5;
      final y = (selected!.shape.y - shapeSize).roundToDouble() - 1.5;
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
    final currSelection = selected;

    select(x, y);

    if (currSelection == selected) {
      return;
    }

    if (selected == null) {
      unSelect();
    }

    repaint();
  }

  @override
  void onMouseMove(double x, double y) {
    if (_isMouseDown) {
      selected?.dragTo(x, y);
      repaint();
    }
  }

  @override
  void onPointerWheel(double deltaX, double deltaY) {
    if (selected != null) {
      selected!.changeSize(deltaY / 5);
      repaint();
    }
  }

  @override
  void onMouseUp() {
    _isMouseDown = false;
  }
}
