import 'dart:ui';

import '../states/selections/selection_state.dart';
import '../states/selections/text_resize_state.dart';
import 'base_shape.dart';

class TextShape extends BaseShape {
  TextShape(super.x, super.y, super.width, super.height) {
    _buildParagraph();
  }

  @override
  void paint(Canvas can) {
    can.drawParagraph(_paragraph, Offset(x, y));
  }

  @override
  SelectionState createSelectionState() {
    return TextResizeState(selectedShape: this);
  }

  @override
  double get width => _paragraph.maxIntrinsicWidth;

  @override
  Rect get rect => Rect.fromLTWH(x, y, width, height);

  @override
  void resize(double _, double newHeight) {
    if (newHeight < 2) {
      newHeight = 2;
    }

    super.resize(_, newHeight);
    final prevWidth = width;
    _buildParagraph();
    final centerX = x + (prevWidth - width) / 2;
    move(centerX, y);
  }

  void _buildParagraph() {
    final style = ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final tStyle = TextStyle(
      fontFamily: 'Arial',
      color: Color(0xffffffff),
      fontSize: height,
    );
    _paragraph = (ParagraphBuilder(style)
          ..pushStyle(tStyle)
          ..addText('Text'))
        .build();
    _paragraph.layout(ParagraphConstraints(width: double.infinity));
  }

  late Paragraph _paragraph;
}
