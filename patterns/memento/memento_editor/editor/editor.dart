import 'dart:math';
import 'dart:ui';

import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import '../memento_pattern/originator.dart';
import '../shapes/shape.dart';
import 'manipulator.dart';
import '../shapes/shapes.dart';

class Editor extends ClassicApp with Manipulator, Shapes, Originator {
  Editor() {
    const positionRadius = 300.0;
    for (var i = 0; i < 7; i++) {
      final x = 60 + positionRadius + cos(i / 1.15) * positionRadius;
      final y = 60 + positionRadius + sin(i / 1.15) * positionRadius;
      shapes.add(Shape(x, y));
    }
  }

  @override
  void onPaint(Canvas canvas, Size canvasSize) {
    _paintBackground(canvas, canvasSize);
    paintShapes(canvas);
    selected?.paintSelectFrame(canvas);
  }

  void _paintBackground(Canvas canvas, Size canvasSize) {
    canvas.drawRect(
      Offset.zero & canvasSize,
      Paint()..color = Color(0xff404040),
    );
  }
}
