import 'manipulator_context.dart';

class ManipulationState {
  ManipulatorContext? context;

  void mouseMove(double x, double y) {}

  void mouseDown(double x, y) {}

  void mouseUp() {}

  void keyDown(String key) {}

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => super.hashCode.toInt();
}
