import 'package:design_patterns_dart/text_canvas.dart';

import 'layout_render.dart';
import 'render_element.dart';

class RenderRow extends RenderLayout {
  RenderRow({
    required List<RenderElement> children,
    int space = 3,
  }) : super(children: children, space: space);

  @override
  void render(Canvas dc) {
    final restoreTranslate = dc.translate;
    var x = dc.translate.x;
    for (final child in children) {
      child.render(dc);
      x += child.width + space;
      dc.translate = Point(x, restoreTranslate.y);
    }
    dc.translate = restoreTranslate;
  }

  @override
  int get width {
    return childWidth + spacesSum;
  }

  @override
  int get height =>
      children.reduce((a, b) => a.width > b.height ? a : b).height;
}
