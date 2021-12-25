import 'package:design_patterns_dart/text_canvas.dart';

import 'render_element.dart';

class RenderText extends RenderElement {
  final String text;
  final BorderStyle? borderStyle;

  RenderText(this.text, {this.borderStyle});

  @override
  int get width => text.length + 2 + 2;

  @override
  int get height => 3;

  @override
  void render(Canvas dc) {
    if (borderStyle != null) {
      dc.border(width, height, borderStyle!);
    }
    dc.text(text, widthCenter: width, heightCenter: height);
  }
}
