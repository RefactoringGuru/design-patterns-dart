import 'package:design_patterns_dart/text_canvas.dart';

import 'engine/shape_engine.dart';
import 'shapes/shape.dart';
import 'shapes/graph_element_adapter.dart';
import 'third_party_graphics_lib/star.dart' as third_party;
import 'third_party_graphics_lib/wave.dart' as third_party;

void main() {
  final renderContent = ShapeEngine(
    width: 42,
    height: 32,
    shapes: [
      // EN: Standard graphics primitives
      Rectangle(
        x: 1,
        y: 1,
        width: 12,
        height: 6,
        color: Color.black,
      ),
      Rectangle(
        x: 4,
        y: 3,
        width: 6,
        height: 9,
        color: Color.white,
      ),
      Circle(
        x: 12,
        y: 12,
        radius: 7,
        color: Color.grey,
      ),
      // EN: Graphics primitives from a third party library
      GraphElementAdapter(
        x: 11,
        y: 20,
        color: Color.dark,
        graphElement: third_party.Wave(height: 5, length: 25),
      ),
      GraphElementAdapter(
        x: 23,
        y: 1,
        color: Color.black,
        graphElement: third_party.Star(size: 20),
      ),
    ],
  );
  print(renderContent.render());
}
