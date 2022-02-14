import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import 'shape.dart';
import 'manipulator.dart';
import 'shapes.dart';

typedef Snapshot = String;


class Editor extends ClassicApp with Manipulator, Shapes {
  Snapshot backup() {
    final byteSize = shapes.length * 16;
    final data = ByteData(byteSize);
    var byteOffset = 0;

    for (final shape in shapes) {
      data
        ..setFloat32(byteOffset, shape.x)
        ..setFloat32(byteOffset + 4, shape.y)
        ..setInt32(byteOffset + 8, shape.color.value)
        ..setFloat32(byteOffset + 12, shape.size);
      byteOffset += 16;
    }

    return data.buffer
        .asUint8List().map((e) => e.toRadixString(16).padLeft(3, '0'))
        .join();
  }

  void restore(Snapshot snapshot) {
    final unBase = Base64Decoder().convert(snapshot);
    final byteData = ByteData.sublistView(unBase);
    final shapeCount = byteData.lengthInBytes ~/ 16;

    shapes.clear();
    var byteOffset = 0;

    for (var i = 0; i < shapeCount; i++) {
      final shape = Shape(
        byteData.getFloat32(byteOffset),
        byteData.getFloat32(byteOffset + 4),
        Color(byteData.getInt32(byteOffset + 8)),
        byteData.getFloat32(byteOffset + 12),
      );
      shapes.add(shape);
      byteOffset += 16;
    }

    repaint();
  }

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
    paintSelectFrame(canvas);
  }

  void _paintBackground(Canvas canvas, Size canvasSize) {
    canvas.drawRect(
      Offset.zero & canvasSize,
      Paint()..color = Color(0xff404040),
    );
  }
}
