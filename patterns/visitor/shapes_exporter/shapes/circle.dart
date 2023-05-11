import '../visitor/visitor.dart';
import 'shape.dart';

class Circle implements Shape {
  final int xCenter;
  final int yCenter;
  final int radius;

  Circle({
    required this.xCenter,
    required this.yCenter,
    required this.radius,
  });

  @override
  void accept(Visitor visitor) {
    visitor.visitCircle(this);
  }

  @override
  void draw() {
    // ...
  }
}
