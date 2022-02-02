import 'dart:ui';

import 'app.dart';

class TextColoring {
  final App app;

  TextColoring(this.app);

  final maxTextSize = 150;

  var _textSize = 50;

  int get textSize => _textSize;

  set textSize(int newVal) {
    if (newVal == _textSize || newVal > maxTextSize || newVal < 1) {
      return;
    }

    _textSize = newVal;
    app.repaint();
  }

  var _textColor = Color(0xffd81b60);

  Color get textColor => _textColor;

  set textColor(Color newColor) {
    if (_textColor == newColor) {
      return;
    }
    print(newColor);
    _textColor = newColor;
    app.repaint();
  }

  void paint(String text, Canvas canvas, Size size) {
    final builder = ParagraphBuilder(
      ParagraphStyle(
        textAlign: TextAlign.center,
        fontSize: _textSize.toDouble(),
      ),
    )
      ..pushStyle(
        TextStyle(
          fontFamily: 'Arial',
          color: _textColor,
        ),
      )
      ..addText(text);

    final paragraph = builder.build()
      ..layout(ParagraphConstraints(width: size.width));

    final centerPos = Offset(0, (size.height - paragraph.height) / 2);
    canvas.drawParagraph(paragraph, centerPos);
  }
}
