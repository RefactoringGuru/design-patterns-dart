import '../../shapes/base_shape.dart';
import '../../shapes/shape.dart';
import 'creation_state.dart';

class TextCreationState extends CreationState {
  @override
  Shape createShape() {
    return BaseShape(100, 100, 100, 100);
  }
}
