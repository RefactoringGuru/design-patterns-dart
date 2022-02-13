import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../adapter/flutter_adapter/classic_app/classic_app.dart';

class MementoEditorApplication extends ClassicApp {
  @override
  void onPaint(Canvas canvas, Size canvasSize) {
    canvas.drawRect(
      Offset.zero & canvasSize,
      Paint()..color = Color(0xff404040),
    );

    final paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..color = Color(0xFFD81B60);

    final paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xffffffff);

    const positionRadius = 300.0;
    for (var i = 0; i < 5; i++) {
      final x =
          positionRadius / 2 + positionRadius + cos(i * 8) * positionRadius;
      final y =
          positionRadius / 2 + positionRadius + sin(i * 8) * positionRadius;

      canvas.drawCircle(Offset(x, y), 60, paintFill);
      canvas.drawCircle(Offset(x, y), 60, paintStroke);
    }
  }
}
