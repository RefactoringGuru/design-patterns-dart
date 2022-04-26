import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import '../../../adapter/flutter_adapter/classic_app/classic_app.dart';
import '../shapes/shape.dart';
import '../shapes/shapes.dart';
import 'snapshot.dart';

mixin Originator implements Shapes, ClassicApp {
  Snapshot backup() {
    final byteSize = shapes.length * 16 + 4;
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

    // save selected shape
    final index = (selected != null) ? shapes.indexOf(selected!.shape) : -1;
    data.setInt32(byteOffset, index);

    return Base64Encoder().convert(data.buffer.asUint8List());
  }

  void restore(Snapshot snapshot) {
    final unBase = Base64Decoder().convert(snapshot);
    final byteData = ByteData.sublistView(unBase);
    final shapeCount = (byteData.lengthInBytes - 4) ~/ 16;

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

    // load selection shape index
    final selectedIndex = byteData.getInt32(byteOffset);

    if (selectedIndex != -1) {
      selectByIndex(selectedIndex);
    }
  }
}
