import 'dart:ui';

import 'base_shape.dart';

class TextShape extends BaseShape {
  final String text;
  final double fontSize;

  TextShape({
    required this.text,
    required this.fontSize,
    required double x,
    required double y,
    required Color color,
  }) : super(
          x: x,
          y: y,
          color: color,
        ) {
    _initTextParagraph();
  }

  @override
  void paint(Canvas can) {
    can.drawParagraph(_paragraph, Offset.zero);
  }

  @override
  double get width => _paragraph.maxIntrinsicWidth;

  @override
  double get height => _paragraph.height;

  late final Paragraph _paragraph;

  void _initTextParagraph() {
    final style = ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final tStyle = TextStyle(
      fontFamily: 'Arial',
      color: color,
      fontSize: fontSize,
    );
    _paragraph = (ParagraphBuilder(style)
          ..pushStyle(tStyle)
          ..addText(text))
        .build();
    _paragraph.layout(ParagraphConstraints(width: double.infinity));
  }
}
