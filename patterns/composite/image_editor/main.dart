import 'package:design_patterns_dart/text_canvas.dart';

import 'editor/image_editor.dart';
import 'shapes/circle.dart';
import 'shapes/compound_shape.dart';
import 'shapes/dot.dart';
import 'shapes/rectangle.dart';

void main() {
  final editor = ImageEditor();
  editor.loadShapes([
    Circle(1, 1, 4, Color.grey),
    CompoundShape([
      Circle(12, 12, 6, Color.dark),
      Dot(12 + 6, 12 + 6, Color.dark),
    ])
      ..select(),
    CompoundShape([
      Rectangle(31, 31, 10, 10, Color.black),
      Dot(28, 28, Color.grey),
      Dot(40, 28, Color.grey),
      Dot(40, 41, Color.grey),
      Dot(28, 41, Color.grey),
    ]),
  ]);
  print(editor.render());
}
