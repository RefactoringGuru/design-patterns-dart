import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import '../shapes/shapes.dart';

mixin Manipulator implements ClassicApp, Shapes {
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
