import 'dart:ui';

import 'app.dart';

class TextColoring {
  final App app;

  TextColoring(this.app);

  final maxTextSize = 200;

  var _size = 50;

  int get size => _size;

  set size(int newVal) {
    if (newVal == _size || newVal > maxTextSize || newVal < 1) {
      return;
    }

    _size = newVal;
    app.repaint();
  }

  var _color = Color(0xffd81b60);

  Color get color => _color;

  set color(Color newColor) {
    if (_color == newColor) {
      return;
    }

    _color = newColor;
    app.repaint();
  }

  void paint(String text, Canvas canvas, Size canvasSize) {
    final builder = ParagraphBuilder(
      ParagraphStyle(
        textAlign: TextAlign.center,
        fontSize: _size.toDouble(),
      ),
    )
      ..pushStyle(
        TextStyle(
          fontFamily: 'Arial',
          color: _color,
        ),
      )
      ..addText(text);

    final paragraph = builder.build()
      ..layout(ParagraphConstraints(width: canvasSize.width));

    final centerPos = Offset(0, (canvasSize.height - paragraph.height) / 2);
    canvas.drawParagraph(paragraph, centerPos);
  }
}
