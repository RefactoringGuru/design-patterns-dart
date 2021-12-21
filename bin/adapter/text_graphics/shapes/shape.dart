import 'package:design_patterns_dart/text_canvas.dart';

abstract class Shape {
  final int x;
  final int y;
  final Color color;

  Shape(this.x, this.y, this.color);

  void draw(Canvas can);
}

class Rectangle extends Shape {
  final int width;
  final int height;

  Rectangle({
    required int x,
    required int y,
    required this.width,
    required this.height,
    required Color color,
  }) : super(x, y, color);

  @override
  void draw(Canvas can) => can.rectangle(width, height);
}

class Circle extends Shape {
  final int radius;

  Circle({
    required int x,
    required int y,
    required this.radius,
    required Color color,
  }) : super(x, y, color);

  @override
  void draw(Canvas can) => can.circle(radius);
}
