import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import '../shapes/shapes.dart';
import '../shapes/shape.dart';
import 'snapshot.dart';

const _shapeByteSize = 16;
const _selectedIndexByteSize = 4;

mixin BackupOriginator implements Shapes {
  Snapshot backup() {
    final buffer = _allocateBuffer();
    _writeShapes(buffer);
    _writeSelectedIndex(buffer);
    return _toSnapshot(buffer);
  }

  ByteData _allocateBuffer() {
    final byteSize = shapes.length * _shapeByteSize + _selectedIndexByteSize;
    return ByteData(byteSize);
  }

  void _writeSelectedIndex(ByteData data) {
    late final int selectedIndex;

    if (activeShape == null) {
      selectedIndex = -1;
    } else {
      selectedIndex = shapes.indexOf(activeShape!.shape);
    }

    final byteOffset = data.lengthInBytes - _selectedIndexByteSize;
    data.setInt32(byteOffset, selectedIndex);
  }

  int _writeShapes(ByteData data) {
    var byteOffset = 0;

    for (final shape in shapes) {
      data
        ..setFloat32(byteOffset, shape.x)
        ..setFloat32(byteOffset + 4, shape.y)
        ..setInt32(byteOffset + 8, shape.color.value)
        ..setFloat32(byteOffset + 12, shape.size);
      byteOffset += _shapeByteSize;
    }

    return byteOffset;
  }

  Snapshot _toSnapshot(ByteData data) {
    return Base64Encoder().convert(
      data.buffer.asUint8List(),
    );
  }
}

mixin RecoveryOriginator implements Shapes {
  void restore(Snapshot snapshot) {
    final byteData = _fromSnapshotToByteData(snapshot);
    final newShapes = _readShapes(byteData);
    final selectedIndex = _readSelectedIndex(byteData);
    shapes.clear();
    shapes.addAll(newShapes);
    selectByIndex(selectedIndex);
  }

  ByteData _fromSnapshotToByteData(Snapshot snapshot) {
    final unBase = Base64Decoder().convert(snapshot);
    final byteData = ByteData.sublistView(unBase);
    return byteData;
  }

  int _getNumberOfShapes(ByteData byteData) {
    return (byteData.lengthInBytes - _selectedIndexByteSize) ~/ _shapeByteSize;
  }

  List<Shape> _readShapes(ByteData byteData) {
    final shapeCount = _getNumberOfShapes(byteData);
    var byteOffset = 0;
    final shapes = <Shape>[];

    for (var i = 0; i < shapeCount; i++) {
      final shape = Shape(
        byteData.getFloat32(byteOffset),
        byteData.getFloat32(byteOffset + 4),
        Color(byteData.getInt32(byteOffset + 8)),
        byteData.getFloat32(byteOffset + 12),
      );
      shapes.add(shape);
      byteOffset += _shapeByteSize;
    }

    return shapes;
  }

  int _readSelectedIndex(ByteData byteData) {
    return byteData.getInt32(byteData.lengthInBytes - _selectedIndexByteSize);
  }
}
