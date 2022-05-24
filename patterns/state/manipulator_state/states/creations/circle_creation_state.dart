import '../../shapes/circle_shape.dart';
import '../../shapes/shape.dart';
import 'creation_state.dart';

class CircleCreationState extends CreationState {
  @override
  Shape createShape(double x, double y) {
    return CircleShape(x, y, 100, 100);
  }

  @override
  String toString() {
    return 'Circle Creation State';
  }
}
