import '../pattern/manipulator_context.dart';
import 'mixins/hover_state_mixin.dart';
import 'mixins/specific_actions_mixin.dart';

class FreeState extends ManipulationState
    with SpecificActionsMixin, HoverStateMixin {
  @override
  void mouseDown(double x, double y) {
    trySelectAndStartMovingShape(x, y);
  }

  @override
  String toString() {
    return 'Free State';
  }
}
