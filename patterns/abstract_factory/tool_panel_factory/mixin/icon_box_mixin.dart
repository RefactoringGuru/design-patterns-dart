import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../pattern/tool_factory.dart';
import '../pattern/shape.dart';

mixin IconBoxMixin implements ToolFactory {
  Image? _icon;

  @override
  Image get icon => _icon!;

  Future<void> updateIcon(Color color) async {
    final shape = createShape(0, 0, color);
    final pngBytes = await _pngImageFromShape(shape);
    _icon = Image.memory(
      pngBytes,
      fit: BoxFit.none,
    );
  }

  Future<Uint8List> _pngImageFromShape(Shape shape) async {
    final iconSize = 32.0;

    final rec = PictureRecorder();
    final can = Canvas(
      rec,
      Rect.fromLTWH(0, 0, iconSize, iconSize),
    );

    _scaleTo(can, shape, iconSize);
    shape.paint(can);

    final image = await rec.endRecording().toImage(
          iconSize.toInt(),
          iconSize.toInt(),
        );
    final bytes = await image.toByteData(format: ImageByteFormat.png);

    if (bytes == null) {
      throw 'Bytes is empty.';
    }

    return bytes.buffer.asUint8List();
  }

  void _scaleTo(Canvas can, Shape shape, double iconSize) {
    var xMove = 0.0;
    var yMove = 0.0;
    late double w;
    late double h;

    if (shape.width >= shape.height) {
      yMove = (shape.width - shape.height);
      w = iconSize / shape.width;
      h = iconSize / (shape.height + yMove);
      yMove /= 2;
    } else {
      xMove = (shape.height - shape.width);
      w = iconSize / (shape.width + xMove);
      h = iconSize / shape.height;
      xMove /= 2;
    }

    can.scale(w, h);
    can.translate(xMove, yMove);
  }
}
