import 'dart:ui';

import '../../../observer/app_observer/observer/event.dart';
import '../adapter/classic_app.dart';
import 'text_coloring.dart';

class NextTextColorEvent extends Event {}

class App extends ClassicAppBase {
  App() {
    textColoring = TextColoring(this);
  }

  late final TextColoring textColoring;

  @override
  void onWheel(double deltaX, double deltaY) {
    textColoring.textSize += deltaY ~/ 10;
  }

  @override
  void onMouseDown() {
    events.notify(NextTextColorEvent());
  }

  @override
  void onPaint(Canvas canvas, Size size) {
    textColoring.paint('Flutter Adapter', canvas, size);
  }
}
