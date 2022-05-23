import '../../pattern/manipulator_context.dart';
import '../../shapes/shape.dart';
import '../free_sate.dart';

abstract class CreationState extends ManipulationState {
  @override
  void mouseDown(double x, double y) {
    final newShape = createShape(x, y);
    context.shapes.add(newShape);
    context.changeState(FreeState());
  }

  Shape createShape(double x, double y);
}
