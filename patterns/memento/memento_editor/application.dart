import 'dart:math';

import 'editor/editor.dart';
import 'memento_pattern/snapshot.dart';
import 'shapes/shape.dart';

class MementoEditorApplication {
  final editor = Editor();
  final snapshots = <Snapshot>[];

  MementoEditorApplication() {
    const positionRadius = 300.0;
    for (var i = 0; i < 7; i++) {
      final x = 60 + positionRadius + cos(i / 1.15) * positionRadius;
      final y = 60 + positionRadius + sin(i / 1.15) * positionRadius;
      editor.shapes.add(Shape(x, y));
    }
  }
}
