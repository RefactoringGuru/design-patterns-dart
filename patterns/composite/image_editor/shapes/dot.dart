import 'package:design_patterns_dart/text_canvas.dart';

import '../editor/image_editor.dart';
import 'base_shape.dart';

class Dot extends BaseShape {
  Dot(int x, int y, Color color) : super(x, y, color);

  @override
  int get width => 1;

  @override
  int get height => 1;

  @override
  void paint(Graphics graphics) {
    super.paint(graphics);
    graphics.setPixel(x, y);
  }
}
