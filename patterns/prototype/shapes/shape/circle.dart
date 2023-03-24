import 'shape.dart';

class Circle extends Shape {
  final int radius;
  final String color;

  Circle({
    required int x,
    required int y,
    required this.radius,
    required this.color,
  }) : super(
          x: x,
          y: y,
        );

  @override
  Circle clone() {
    return Circle(
      x: x,
      y: y,
      radius: radius,
      color: color,
    );
  }
}
