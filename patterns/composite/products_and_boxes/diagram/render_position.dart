import 'package:design_patterns_dart/text_canvas/canvas.dart';
import 'package:design_patterns_dart/text_canvas/primitives.dart';

import 'render_element.dart';

class RenderPosition extends RenderElement {
  final int x;
  final int y;
  final RenderElement child;

  RenderPosition({
    required this.x,
    required this.y,
    required this.child,
  });

  @override
  int get height => child.height;

  @override
  int get width => child.width;

  @override
  void render(Canvas dc) {
    final oldTranslate = dc.translate;
    dc.translate = Point(oldTranslate.x + x, oldTranslate.y + y);
    child.render(dc);
    dc.translate = oldTranslate;
  }
}
