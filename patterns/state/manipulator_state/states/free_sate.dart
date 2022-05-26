import '../pattern/manipulator.dart';
import 'mixins/hover_shape_mixin.dart';
import 'selections/moving_state.dart';

class FreeState extends ManipulationState with HoverShapeMixin {
  @override
  void mouseDown(double x, double y) {
    trySelectAndStartMovingShape(x, y);
  }

  bool trySelectAndStartMovingShape(double x, double y) {
    if (hoverShape == null) {
      return false;
    }

    context.changeState(
      MovingState(
        startX: x,
        startY: y,
        selectedShape: hoverShape!,
      ),
    );

    return true;
  }

  @override
  String toString() {
    return 'Free State';
  }
}
