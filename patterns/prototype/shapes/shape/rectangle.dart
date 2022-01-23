import 'shape.dart';

class Rectangle extends Shape {
  final int width;
  final int height;
  final String color;

  Rectangle({
    required int x,
    required int y,
    required this.width,
    required this.height,
    required this.color,
  }) : super(x: x, y: y);

  @override
  Rectangle clone() {
    return Rectangle(
      x: x,
      y: y,
      width: width,
      height: height,
      color: color,
    );
  }
}
