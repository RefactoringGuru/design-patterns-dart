import 'dart:ui';

import '../../classic_app/repaint_compatible.dart';

class TextColoring {
  final RepaintCompatible _repaintContext;

  TextColoring(this._repaintContext);

  TextColoring(this.text, this._repaintSignal);

  final maxTextSize = 200;

  var _size = 50;

  int get size => _size;

  set size(int newVal) {
    if (newVal == _size || newVal > maxTextSize || newVal < 1) {
      return;
    }

    _size = newVal;
    _repaintSignal();
  }

  var _color = Color(0xffd81b60);

  Color get color => _color;

  set color(Color newColor) {
    if (_color == newColor) {
      return;
    }

    _color = newColor;
    _repaintSignal();
  }

  void paint(Canvas canvas, Size canvasSize) {
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
