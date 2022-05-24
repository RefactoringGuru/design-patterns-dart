import '../pattern/manipulator_context.dart';
import 'hover_state_mixin.dart';
import 'specific_actions_mixin.dart';

class FreeState extends ManipulationState
    with SpecificActionsMixin, HoverStateMixin {
  @override
  void mouseDown(double x, double y) {
    trySelectShape(x, y);
  }
}
