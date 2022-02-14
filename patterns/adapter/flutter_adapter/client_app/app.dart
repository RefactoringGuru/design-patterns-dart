import 'dart:ui';

import '../classic_app/classic_app.dart';
import 'business_rules/color_rules.dart';
import 'business_rules/text_coloring.dart';

class App extends ClassicApp {
  late final TextColoring textColoring;
  late final ColorRules colorRules;

  App() {
    textColoring = TextColoring(this);
    colorRules = ColorRules();
  }

  @override
  void onPointerWheel(double deltaX, double deltaY) {
    textColoring.size += deltaY ~/ 10;
  }

  @override
  void onMouseDown(_, __) {
    textColoring.color = colorRules.nextColor(textColoring.color);
  }

  @override
  void onPaint(Canvas canvas, Size canvasSize) {
    paintText(
      canvas,
      'Flutter Adapter',
      canvasSize,
      textColoring.size.toDouble(),
      textColoring.color,
    );

    paintText(
      canvas,
      'Click on the text to change the text color.\n'
      'Scroll the mouse wheel to change the text size.',
      canvasSize,
      16,
      Color(0xff848484),
      Offset(0, canvasSize.height - 50),
    );
  }
}

void paintText(
  Canvas canvas,
  String text,
  Size boxSize,
  double textSize,
  Color color, [
  Offset? pos,
]) {
  final builder = ParagraphBuilder(
    ParagraphStyle(
      textAlign: TextAlign.center,
      fontSize: textSize,
    ),
  )
    ..pushStyle(
      TextStyle(
        fontFamily: 'Arial',
        color: color,
      ),
    )
    ..addText(text);

  final paragraph = builder.build()
    ..layout(
      ParagraphConstraints(
        width: boxSize.width,
      ),
    );

  pos ??= Offset(0, (boxSize.height - paragraph.height) / 2);
  canvas.drawParagraph(paragraph, pos);
}
