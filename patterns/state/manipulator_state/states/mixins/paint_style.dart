import 'package:flutter/material.dart';

import '../../shapes/shape.dart';

class PaintStyle {
  PaintStyle(this.color)
      : _selectStroke = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
        _markerStroke = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
        _markerFill = Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.black;

  final Color color;

  void paintHover(Canvas canvas, Shape shape) {
    canvas.drawRect(
      shape.rect.deflate(1),
      _selectStroke,
    );
  }

  void paintMarker(Canvas canvas, Shape shape) {
    final point = Offset(shape.x, shape.y);
    canvas.drawCircle(
      point,
      shape.width,
      _markerFill,
    );
    canvas.drawCircle(
      point,
      shape.width,
      _markerStroke,
    );
  }

  final Paint _selectStroke;
  final Paint _markerStroke;
  final Paint _markerFill;
}
