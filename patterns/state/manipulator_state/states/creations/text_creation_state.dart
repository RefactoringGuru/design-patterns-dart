import '../../shapes/shape.dart';
import '../../shapes/text_shape.dart';
import '../_/creation_state.dart';

class TextCreationState extends CreationState {
  @override
  Shape createShape(double x, double y) {
    return TextShape(x, y, 2);
  }

  @override
  String toString() {
    return 'Text Creation State';
  }
}
