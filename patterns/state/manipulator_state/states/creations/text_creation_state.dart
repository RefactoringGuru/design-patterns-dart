import '../../shapes/base_shape.dart';
import '../../shapes/shape.dart';
import 'creation_state.dart';

class TextCreationState extends CreationState {
  @override
  Shape createShape(double x, double y) {
    return BaseShape(x, y, 100, 100);
  }
}
