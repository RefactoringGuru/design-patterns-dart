import '../pattern/manipulator_context.dart';
import 'specific_actions_mixin.dart';

class FreeState extends ManipulationState with SpecificActionsMixin {
  @override
  void mouseDown(double x, double y) {
    trySelectShape(x, y);
  }
}


