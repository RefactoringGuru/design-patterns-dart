import 'package:design_patterns_dart/text_canvas.dart';

import '../render_elements/render_column.dart';
import 'render_element.dart';
import 'render_position.dart';
import 'render_row.dart';
import 'render_layout.dart';
import 'render_text.dart';

class RenderConnectingLines extends RenderElement {
  RenderConnectingLines({
    required RenderElement parent,
    required List<RenderElement> children,
  }) {
    final row = RenderRow(
      children: children,
    );

    _child = RenderColumn(
      children: [
        parent,
        row,
      ],
    );
    _lines = _Lines(_child.positions.first, row.positions);
  }

  late final RenderLayout _child;
  late final _Lines _lines;

  @override
  int get height => _child.height;

  @override
  int get width => _child.width;

  @override
  void render(Canvas dc) {
    _child.render(dc);
    _lines.render(dc);
  }
}

class _Lines {
  final RenderPosition parent;
  final List<RenderPosition> childPos;

  _Lines(this.parent, this.childPos);

  void render(Canvas dc) {
    if (parent.child is RenderText) {
      final x = parent.x + parent.width ~/ 2;
      var y = parent.y + parent.height - 1;
      dc.char(x, y, Color('┬'));

      if (childPos.length == 1) {
        dc.char(x, ++y, Color('│'));
        dc.char(x, ++y, Color('┴'));
        return;
      }

      if (childPos.length > 2) {
        dc.char(x, ++y, Color('┼'));
      }

      dc.char(x, ++y, Color('┴'));

      if (childPos.length == 2) {
        y++;
      }

      drawLeftLine(x, y, dc);
      drawRightLine(x, y, dc);
    }
  }

  void drawLeftLine(int parentCenterX, int y, Canvas dc) {
    var x = childPos.first.x + (childPos.first.width ~/ 2);
    dc.char(x, y, Color('┴'));
    dc.char(x, --y, Color('┌'));

    while (x < parentCenterX - 1) {
      dc.char(++x, y, Color('─'));
    }
  }

  void drawRightLine(int parentCenterX, int y, Canvas dc) {
    final currChild = childPos.length == 2 ? childPos[1] : childPos[2];
    var x = currChild.x + (currChild.width ~/ 2);
    dc.char(x, y, Color('┴'));
    dc.char(x, --y, Color('┐'));

    while (x > parentCenterX + 1) {
      dc.char(--x, y, Color('─'));
    }
  }
}
