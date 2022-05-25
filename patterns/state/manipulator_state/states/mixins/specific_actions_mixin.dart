import '../../pattern/manipulation_context.dart';
import '../selections/moving_state.dart';

mixin SpecificActionsMixin implements ManipulationState {
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
}
