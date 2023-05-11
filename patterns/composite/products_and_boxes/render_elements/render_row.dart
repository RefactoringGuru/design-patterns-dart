import 'render_element.dart';
import 'render_layout.dart';
import 'render_position.dart';

class RenderRow extends RenderLayout {
  RenderRow({
    required List<RenderElement> children,
    int space = 3,
  }) : super(children: children, space: space);

  @override
  int get width => childWidth + spacesSum;

  @override
  int get height =>
      children.reduce((a, b) => a.height > b.height ? a : b).height;

  @override
  List<RenderPosition> compute() {
    final result = <RenderPosition>[];
    var x = 0;
    final y = 0;

    for (final child in children) {
      result.add(
        RenderPosition(x: x, y: y, child: child),
      );
      x += child.width + space;
    }

    return result;
  }
}
