import '../visitor/visitor.dart';
import 'shape.dart';

class CompoundShape implements Shape {
  final int x;
  final int y;
  final List<Shape> children;

  CompoundShape({
    required this.x,
    required this.y,
    required this.children,
  });

  @override
  void accept(Visitor visitor) {
    visitor.visitCompoundShape(this);
  }

  @override
  void draw() {
    // ...
  }
}
