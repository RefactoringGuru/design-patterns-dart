import '../../shapes/rectangle_shape.dart';
import '../../shapes/shape.dart';
import '../_/creation_state.dart';

class RectangleCreationState extends CreationState {
  @override
  Shape createShape(double x, double y) {
    return RectangleShape(x, y, 0, 0);
  }

  @override
  String toString() {
    return 'Rectangle Creation State';
  }
}
