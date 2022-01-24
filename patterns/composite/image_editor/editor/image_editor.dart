import 'package:design_patterns_dart/text_canvas.dart';

import '../shapes/compound_shape.dart';
import '../shapes/shape.dart';

typedef Graphics = Canvas;

class ImageEditor {
  final _allShapes = CompoundShape();

  void loadShapes(List<Shape> shapes) {
    _allShapes
      ..clear()
      ..addAll(shapes);
  }

  String render() {
    final graphics = Graphics(_allShapes.width + 2, _allShapes.height + 2);
    _allShapes.paint(graphics);
    return graphics.toString();
  }
}
