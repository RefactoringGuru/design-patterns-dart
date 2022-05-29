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

  bool get turnOnInnerRadius => _turnOnInnerRadius;

  set innerRadius(double newValue) {
    if (newValue > width / 2) {
      _turnOnInnerRadius = false;
      _innerRadius = newValue;
      return;
    } else if (newValue < 1) {
      newValue = 1;
    }
    _drawInnerRadius = true;
    _turnOnInnerRadius = true;
    _innerRadius = newValue;
  }

  @override
  void resize(double width, double height) {
    _drawInnerRadius = width > _innerRadius * 2;
    super.resize(width, height);
  }

  @override
  SelectionState createSelectionState() {
    return InnerRadiusState(selectedShape: this);
  }

  @override
  void paint(Canvas canvas) {
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addOval(rect);

    if (_drawInnerRadius) {
      final fixHeight = height / width;
      path.addOval(
        Rect.fromLTWH(
          x + innerRadius,
          y + innerRadius * fixHeight,
          width - innerRadius * 2,
          height - innerRadius * 2 * fixHeight,
        ),
      );
    }

    canvas.drawPath(
      path,
      Paint()..color = Colors.white,
    );
  }

  late double _innerRadius;
  bool _drawInnerRadius = true;
  bool _turnOnInnerRadius = true;
}
