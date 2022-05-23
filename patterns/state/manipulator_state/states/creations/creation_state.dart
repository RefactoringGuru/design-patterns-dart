import '../../pattern/manipulation_state.dart';
import '../free_sate.dart';

abstract class CreationState extends ManipulationState {
  @override
  void mouseDown(double x, y) {
    print(createShape());
    context!.changeState(FreeState());
  }

  String createShape();
}
