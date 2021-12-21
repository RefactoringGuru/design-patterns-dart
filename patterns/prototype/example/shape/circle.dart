import 'rectangle.dart';

class Circle extends Rectangle {
  final int radius;

  Circle({
    required int x,
    required int y,
    required this.radius,
    required String color,
  }) : super(
          x: x,
          y: y,
          width: radius,
          height: radius,
          color: color,
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
