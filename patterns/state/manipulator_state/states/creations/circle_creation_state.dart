import '../../shapes/circle_shape.dart';
import '../../shapes/shape.dart';
import '../_/creation_state.dart';

class CircleCreationState extends CreationState {
  @override
  Shape createShape(double x, double y) {
    return CircleShape(x, y, 100, 100, 25);
  }

  @override
  String toString() {
    return 'Circle Creation State';
  }
}
