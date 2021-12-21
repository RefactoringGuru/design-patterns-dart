import 'package:design_patterns_dart/text_canvas.dart';

abstract class RenderElement {
  int get width;

  final int height = 0;

  String render(Canvas dc);
}

class BorderText extends RenderElement {
  @override
  int get width => text.length + 2 + 2;

  @override
  int get height => 3;

  final String text;
  final BorderStyle borderStyle;

  BorderText(this.text, this.borderStyle);

  @override
  String render(Canvas dc) {
    return (dc
          ..text(text, widthCenter: width, heightCenter: height)
          ..border(width, height, borderStyle))
        .toString();
  }
}
