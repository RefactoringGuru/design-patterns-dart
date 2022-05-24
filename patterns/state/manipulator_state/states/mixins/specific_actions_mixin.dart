import '../../pattern/manipulator_context.dart';
import '../selections/selection_state.dart';

mixin SpecificActionsMixin implements ManipulationState {
  bool trySelectShape(double x, double y) {
    final shape = context.shapes.shapeFromCoordinate(x, y);

    if (shape == null) {
      return false;
    }

    if (context.state is SelectionState &&
        (context.state as SelectionState).selectedShape == shape) {
      return true;
    }

    context.changeState(
      shape.createSelectionState(),
    );

    context.update();
    return true;
  }
}
