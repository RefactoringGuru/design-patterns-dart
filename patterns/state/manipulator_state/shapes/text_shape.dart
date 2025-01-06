import 'dart:ui';

import '../states/selections/selection_state.dart';
import '../states/selections/text_resize_state.dart';
import 'base_shape.dart';

class TextShape extends BaseShape {
  TextShape(double x, double y, double height) : super(x, y, 0, height) {
    _buildParagraph(height);
  }

  String get text => _text;

  set text(String newText) {
    _text = newText;
    _buildParagraph(_textHeight);
  }

  double get userHeight => _textHeight;

  Paragraph get paragraph => _paragraph;

  @override
  Rect get rect {
    final fixY = height - _textHeight;
    return Rect.fromLTWH(x, y + fixY, width, height - fixY);
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
  void resize(double _, double newHeight) {
    if (newHeight < 2) {
      newHeight = 2;
    }

    final oldWidth = width;
    _buildParagraph(newHeight);
    final centerX = x - (width - oldWidth) / 2;
    move(centerX, y);
  }

  void _buildParagraph(double newHeight) {
    _textHeight = newHeight;

    final style = ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final tStyle = TextStyle(
      fontFamily: 'Arial',
      color: Color(0xffffffff),
      fontSize: newHeight,
    );
    _paragraph = (ParagraphBuilder(style)
          ..pushStyle(tStyle)
          ..addText(_text))
        .build();
    _paragraph.layout(ParagraphConstraints(width: double.infinity));

    super.resize(_paragraph.maxIntrinsicWidth, _paragraph.height);
  }

  late Paragraph _paragraph;
  String _text = 'Text';
  late double _textHeight;
}
