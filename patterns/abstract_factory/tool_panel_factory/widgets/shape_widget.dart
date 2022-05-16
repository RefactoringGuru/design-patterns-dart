import 'package:flutter/material.dart';
import '../pattern/shape.dart';

class ShapeWidget extends StatelessWidget {
  final Shape shape;

  const ShapeWidget({
    Key? key,
    required this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: shape.x,
      top: shape.y,
      child: CustomPaint(
        size: Size(shape.width, shape.height),
        painter: PaintShape(shape),
      ),
    );
  }
}

class PaintShape extends CustomPainter {
  final Shape shape;

  PaintShape(this.shape);

  @override
  void paint(Canvas canvas, Size _) {
    shape.paint(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) {
    return false;
  }
}
