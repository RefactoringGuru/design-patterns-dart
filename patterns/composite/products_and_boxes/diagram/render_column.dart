import 'package:design_patterns_dart/text_canvas.dart';

import 'layout_render.dart';
import 'render_element.dart';

class RenderColumn extends RenderLayout {
  RenderColumn({
    required List<RenderElement> children,
    int space = 1,
  }) : super(children: children, space: space);

  @override
  void render(Canvas dc) {
    final restoreTranslate = dc.translate;
    var y = dc.translate.y;
    for (final child in children) {
      final xCenter = (width - child.width) ~/ 2;
      dc.translate = Point(xCenter + dc.translate.x, dc.translate.y);

      child.render(dc);

      y += child.height + space;
      dc.translate = Point(restoreTranslate.x, y);
    }
    dc.translate = restoreTranslate;
  }

  @override
  int get width => children.reduce((a, b) => a.width > b.width ? a : b).width;

  @override
  int get height {
    return childHeight + spacesSum;
  }
}
