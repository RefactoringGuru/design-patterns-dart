import '../visitor/visitor.dart';
import 'shape.dart';

class Dot implements Shape {
  final int x;
  final int y;

  Dot({
    required this.x,
    required this.y,
  });

  @override
  void accept(Visitor visitor) {
    visitor.visitDot(this);
  }

  @override
  void draw() {
    // ...
  }
}
