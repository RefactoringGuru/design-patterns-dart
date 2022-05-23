import '../../shapes/base_shape.dart';
import '../../shapes/shape.dart';
import 'creation_state.dart';

class CircleCreationState extends CreationState {
  @override
  Shape createShape() {
    return BaseShape(100, 100, 100, 100);
  }
}
