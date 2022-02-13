import 'dart:ui';

import '../../adapter/flutter_adapter/classic_app/classic_app.dart';

class MementoEditorApplication extends ClassicApp {
  @override
  void onPaint(Canvas canvas, Size canvasSize) {
    canvas.drawRect(
      Offset.zero & canvasSize,
      Paint()..color = Color(0xff2ac932),
    );
  }
}
