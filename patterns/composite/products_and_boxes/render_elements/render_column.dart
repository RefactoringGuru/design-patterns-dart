import 'render_element.dart';
import 'render_layout.dart';
import 'render_position.dart';

class RenderColumn extends RenderLayout {
  RenderColumn({
    required List<RenderElement> children,
    int space = 1,
  }) : super(children: children, space: space);

  @override
  int get width => children.reduce((a, b) => a.width > b.width ? a : b).width;

  @override
  int get height => childHeight + spacesSum;

  @override
  List<RenderPosition> compute() {
    final result = <RenderPosition>[];
    var y = 0;

    for (final child in children) {
      final xCenter = (width - child.width) ~/ 2;
      result.add(
        RenderPosition(
          x: xCenter,
          y: y,
          child: child,
        ),
      );

      y += child.height + space;
    }
    return result;
  }
}
