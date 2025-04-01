import '../visitor/visitor.dart';
import 'shape.dart';

class Rectangle implements Shape {
  final int x;
  final int y;
  final int width;
  final int height;

  Rectangle({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  @override
  void accept(Visitor visitor) {
    visitor.visitRectangle(this);
  }

  @override
  void draw() {
    // ...
  }
}
