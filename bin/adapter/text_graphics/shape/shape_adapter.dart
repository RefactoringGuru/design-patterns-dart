import '../engine/canvas.dart';
import '../engine/primitives.dart';
import '../third_party_graphics_lib/graph_element.dart' as third_party;
import 'shape.dart';

class ShapeAdapter extends Shape {
  final third_party.GraphElement graphElement;

  ShapeAdapter({
    required int x,
    required int y,
    required Color color,
    required this.graphElement,
  }) : super(x, y, color);

  @override
  void draw(Canvas can) {
    final points = graphElement.points;
    can.moveTo(points[0], points[1]);
    for (var i = 0; i < points.length; i += 2) {
      can.lineTo(points[i], points[i + 1]);
    }
  }
}
