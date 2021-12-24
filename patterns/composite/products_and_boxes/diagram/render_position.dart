import 'package:design_patterns_dart/text_canvas.dart';

import 'render_element.dart';

class RenderPosition extends RenderElement {
  final int x;
  final int y;
  final RenderElement renderElement;

  RenderPosition(this.x, this.y, this.renderElement);

  @override
  void render(Canvas dc) {
    final old = dc.translate;
    dc.translate = Point(x, y);
    renderElement.render(dc);
    dc.translate = old;
  }

  @override
  int get width => renderElement.width;

  @override
  int get height => renderElement.height;
}
