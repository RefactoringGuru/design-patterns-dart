import 'dart:ui';

import '../../../observer/app_observer/observer/event.dart';
import '../adapter/classic_app.dart';

class NextTextColorEvent extends Event {}

class App extends ClassicAppBase {
  final maxTextSize = 150;

  var _textSize = 50;

  int get textSize => _textSize;

  set textSize(int newVal) {
    if (newVal == _textSize || newVal > maxTextSize || newVal < 1) {
      return;
    }

    _textSize = newVal;
    repaint();
  }

  var _textColor = Color(0xffd81b60);

  Color get textColor => _textColor;

  set textColor(Color newColor) {
    if (_textColor == newColor) {
      return;
    }
    print(newColor);
    _textColor = newColor;
    repaint();
  }

  @override
  void onWheel(double deltaX, double deltaY) {
    textSize += deltaY ~/ 10;
  }

  @override
  void onMouseDown() {
    events.notify(NextTextColorEvent());
  }

  @override
  void onPaint(Canvas canvas, Size size) {
    _paintTextCenter('Flutter Adapter', canvas, size);
  }

  void _paintTextCenter(String text, Canvas canvas, Size size) {
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
