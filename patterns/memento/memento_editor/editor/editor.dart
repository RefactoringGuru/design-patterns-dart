import 'dart:ui';

import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import '../memento_pattern/originator.dart';
import '../shapes/shapes.dart';
import 'manipulator.dart';

class Editor extends ClassicApp
    with Manipulator, Shapes, BackupOriginator, RecoveryOriginator {
  @override
  void onPaint(Canvas canvas, Size canvasSize) {
    _paintBackground(canvas, canvasSize);
    paintShapes(canvas);
    activeShape?.paintSelectionBox(canvas);
  }

  void _paintBackground(Canvas canvas, Size canvasSize) {
    canvas.drawRect(
      Offset.zero & canvasSize,
      Paint()..color = Color(0xff404040),
    );
  }
}
