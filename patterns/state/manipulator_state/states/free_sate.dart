import '../pattern/manipulator.dart';
import 'mixins/hover_state_mixin.dart';
import 'selections/moving_state.dart';

class FreeState extends ManipulationState with HoverStateMixin {
  @override
  void mouseDown(double x, double y) {
    trySelectAndStartMovingShape(x, y);
  }

  bool trySelectAndStartMovingShape(double x, double y) {
    final shape = context.shapes.findShapeByCoordinates(x, y);

    if (shape == null) {
      return false;
    }

    context.changeState(
      MovingState(
        startX: x,
        startY: y,
        selectedShape: shape,
      ),
    );

    return true;
  }

  @override
  String toString() {
    return 'Free State';
  }
}
