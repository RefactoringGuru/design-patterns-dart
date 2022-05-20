import 'package:flutter/material.dart';
import '../app/shapes.dart';
import 'independent/event_listenable_builder.dart';

class DrawingBoard extends StatelessWidget {
  final Shapes shapes;
  final Function(double x, double y) onClick;

  const DrawingBoard({
    Key? key,
    required this.shapes,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (e) => addShape(e.localPosition),
      child: Container(
        color: Color(0xff1f1f1f),
        child: EventListenableBuilder(
          event: shapes.onAddShapeEvent,
          builder: (_) {
            return LayoutBuilder(
              builder: (_, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: ShapesPainter(shapes),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void addShape(Offset position) {
    onClick(position.dx, position.dy);
  }
}

class ShapesPainter extends CustomPainter {
  final Shapes shapes;

  ShapesPainter(this.shapes);

  @override
  void paint(Canvas canvas, Size _) {
    for (final shape in shapes) {
      canvas.save();
      canvas.translate(shape.x, shape.y);
      shape.paint(canvas);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) {
    return false;
  }
}
