import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import '../shapes/shapes.dart';

mixin Manipulator implements ClassicApp, Shapes {
  var _isMouseDown = false;

  @override
  void onMouseDown(double x, double y) {
    _isMouseDown = true;
    final currSelection = activeShape;

    select(x, y);

    if (currSelection == activeShape) {
      return;
    }

    if (activeShape == null) {
      unSelect();
    }

    repaint();
  }

  @override
  void onMouseMove(double x, double y) {
    if (_isMouseDown) {
      activeShape?.dragTo(x, y);
      repaint();
    }
  }

  @override
  void onPointerWheel(double deltaX, double deltaY) {
    activeShape?.changeSize(deltaY / 5);
  }

  @override
  void onMouseUp() {
    _isMouseDown = false;
  }
}
