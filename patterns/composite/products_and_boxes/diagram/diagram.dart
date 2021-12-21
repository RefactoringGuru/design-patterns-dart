import 'package:design_patterns_dart/text_canvas.dart';

import 'render_element.dart';

class PositionRenderElement {
  final int x;
  final int y;
  final RenderElement renderElement;

  PositionRenderElement(this.x, this.y, this.renderElement);
}

class Diagram extends RenderElement {
  final _graph = <PositionRenderElement>[];

  var _w = 0;
  void addRenderElement(int x, int y, RenderElement renderElement) {
    final w = x + renderElement.width;
    if (w > _w) {
      _w = w;
    }
    _graph.add(PositionRenderElement(x, y, renderElement));
  }

  @override
  int get width => _w;

  @override
  String render(Canvas dc) {
    return '';
  }
}
