import 'package:design_patterns_dart/text_canvas.dart';

abstract class RenderElement {
  int get width;

  int get height;

  void render(Canvas dc);
}
