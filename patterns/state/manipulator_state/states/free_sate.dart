import '../pattern/manipulator_context.dart';

class FreeState extends ManipulationState {
  @override
  void mouseDown(double x, y) {
    print('selected');
  }
}
