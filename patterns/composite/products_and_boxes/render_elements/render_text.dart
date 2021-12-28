import 'package:design_patterns_dart/text_canvas.dart';
import 'package:design_patterns_dart/text_canvas/primitives.dart';

import 'render_element.dart';

class RenderText extends RenderElement {
  final String text;
  final BorderStyle borderStyle;

  RenderText(this.text, {required this.borderStyle});

  @override
  int get width => text.length + 2 + 2;

  @override
  int get height => 3;

  @override
  void render(Canvas dc) {
    if (borderStyle != BorderStyle.empty) {
      dc.border(width, height, borderStyle);
    }
    dc.text(text, widthCenter: width, heightCenter: height);
  }
}
