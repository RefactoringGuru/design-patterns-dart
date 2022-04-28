import '../shapes/shapes.dart';

mixin Manipulator implements Shapes {
  var _isMouseDown = false;

  @override
  void onMouseDown(double x, double y) {
    _isMouseDown = true;
    select(x, y);
  }

  @override
  void onMouseMove(double x, double y) {
    if (_isMouseDown) {
      activeShape?.dragTo(x, y);
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
