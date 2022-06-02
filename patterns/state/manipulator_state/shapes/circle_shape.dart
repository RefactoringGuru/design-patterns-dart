import 'package:flutter/material.dart';

import '../states/selections/inner_radius_state.dart';
import '../states/selections/selection_state.dart';
import 'base_shape.dart';

class CircleShape extends BaseShape {
  CircleShape(
    super.x,
    super.y,
    super.width,
    super.height,
    double innerRadius,
  ) {
    this.innerRadius = innerRadius;
  }

  double get innerRadius =>
      _turnOnInnerRadius && _drawInnerRadius ? _innerRadius : width / 2;

  set innerRadius(double newValue) {
    if (newValue > width / 2) {
      _turnOnInnerRadius = false;
      _innerRadius = newValue;
      _buildPath();
      return;
    } else if (newValue < 1) {
      newValue = 1;
    }

    _drawInnerRadius = true;
    _turnOnInnerRadius = _drawInnerRadius;
    _innerRadius = newValue;
    _buildPath();
  }

  @override
  void resize(double width, double height) {
    super.resize(width, height);
    _drawInnerRadius = width > _innerRadius * 2;
    _buildPath();
  }

  @override
  void move(double x, double y) {
    super.move(x, y);
    _buildPath();
  }

  @override
  SelectionState createSelectionState() {
    return InnerRadiusState(selectedShape: this);
  }

  @override
  void paint(Canvas canvas) {
    canvas.drawPath(
      _path,
      Paint()..color = Colors.white,
    );
  }

  void _buildPath() {
    _path = Path()
      ..fillType = PathFillType.evenOdd
      ..addOval(rect);

    if (_drawInnerRadius) {
      final fixHeight = height / width;
      final doubleRadius = innerRadius * 2;
      _path.addOval(
        Rect.fromLTWH(
          x + innerRadius,
          y + innerRadius * fixHeight,
          width - doubleRadius,
          height - doubleRadius * fixHeight,
        ),
      );
    }
  }

  late double _innerRadius;
  late Path _path;
  bool _drawInnerRadius = true;
  bool _turnOnInnerRadius = true;
}
