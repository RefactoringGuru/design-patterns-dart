import 'package:flutter/material.dart';

import '../../shapes/circle_shape.dart';
import '../../shapes/shape.dart';
import '../../shapes/text_shape.dart';
import '../selections/text/text_cursor.dart';

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

  void paintSelection(Canvas canvas, Shape shape) {
    paintHover(canvas, shape);
  }

  void paintMarker(Canvas canvas, Shape markerShape) {
    final point = Offset(markerShape.x, markerShape.y);
    canvas.drawCircle(
      point,
      markerShape.width,
      _markerFill,
    );
    canvas.drawCircle(
      point,
      markerShape.width,
      _markerStroke,
    );
  }

  void paintRadiusLine(CircleShape selectedShape, Canvas canvas) {
    canvas.save();
    canvas.translate(selectedShape.x, selectedShape.y);
    final x = selectedShape.width - selectedShape.innerRadius;
    final y = selectedShape.height / 2;
    canvas.drawLine(
      Offset(x, y),
      Offset(selectedShape.width, y),
      Paint()
        ..color = color
        ..strokeWidth = 1.5,
    );

    canvas.restore();
  }

  void paintSelectedText(TextShape selectedShape, Canvas canvas) {
    canvas.drawRect(
      selectedShape.rect,
      Paint()..color = color.withOpacity(0.3),
    );
  }

  void paintTextCursor(
    TextCursor cursor,
    TextShape selectedShape,
    Canvas canvas,
  ) {
    canvas.drawLine(
      Offset(
        cursor.xCoordinate,
        selectedShape.y + (selectedShape.height - selectedShape.userHeight) + 2,
      ),
      Offset(
        cursor.xCoordinate,
        selectedShape.y + (selectedShape.height) - 2,
      ),
      Paint()
        ..strokeWidth = 2.2
        ..color = Colors.white,
    );
  }

  final Paint _selectStroke;
  final Paint _markerStroke;
  final Paint _markerFill;
}
