import 'package:flutter/material.dart';
import '../app/shapes.dart';
import 'independent/event_listenable_builder.dart';
import 'shape_widget.dart';

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
            return Stack(
              children: [
                for (final shape in shapes) ShapeWidget(shape: shape),
              ],
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
