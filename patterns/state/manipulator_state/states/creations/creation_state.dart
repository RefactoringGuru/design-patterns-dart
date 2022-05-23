import '../../pattern/manipulator_context.dart';
import '../../shapes/shape.dart';

abstract class CreationState extends ManipulationState {
  @override
  void mouseDown(double x, y) {
    final newShape = createShape();
    context.shapes.add(newShape);
    context.changeState(newShape.createSelectionState());
  }

  Shape createShape();
}
