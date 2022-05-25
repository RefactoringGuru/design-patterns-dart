import 'dart:ui';

import 'package:flutter/services.dart';

import '../../../shapes/marker_shape.dart';
import '../../../shapes/shape.dart';
import '../../../pattern/manipulation_context.dart';
import '../../mixins/hover_state_mixin.dart';
import '../resizable_state.dart';
import '../selection_state.dart';

class MarkerState extends ManipulationState with HoverStateMixin {
  final SelectionState parentState;
  final Shape markerShape;
  final MouseCursor hoverCursor;

  MarkerState({
    required double x,
    required double y,
    required this.hoverCursor,
    required this.parentState,
  }) : markerShape = MarkerShape(x, y);

  factory MarkerState.topLeft(SelectionState parentState) {
    return MarkerState(
      x: parentState.selectedShape.x,
      y: parentState.selectedShape.y,
      hoverCursor: SystemMouseCursors.resizeUpLeft,
      parentState: parentState,
    ).._name = 'MarkerState.topLeft';
  }

  factory MarkerState.topRight(SelectionState parentState) {
    return MarkerState(
      x: parentState.selectedShape.x + parentState.selectedShape.width,
      y: parentState.selectedShape.y,
      hoverCursor: SystemMouseCursors.resizeUpRight,
      parentState: parentState,
    ).._name = 'MarkerState.topRight';
  }

  factory MarkerState.bottomRight(SelectionState parentState) {
    return MarkerState(
      x: parentState.selectedShape.x + parentState.selectedShape.width,
      y: parentState.selectedShape.y + parentState.selectedShape.height,
      hoverCursor: SystemMouseCursors.resizeDownRight,
      parentState: parentState,
    ).._name = 'MarkerState.bottomRight';
  }

  factory MarkerState.bottomLeft(SelectionState parentState) {
    return MarkerState(
      x: parentState.selectedShape.x,
      y: parentState.selectedShape.y + parentState.selectedShape.height,
      hoverCursor: SystemMouseCursors.resizeDownLeft,
      parentState: parentState,
    ).._name = 'MarkerState.bottomLeft';
  }


  @override
  void mouseDown(double x, double y) {
    if (isHover) {
      _isDown = true;
      context.changeState(this);
    }
  }

  @override
  void mouseMove(double x, double y) {
    super.mouseMove(x, y);
    if (_isDown) {
      parentState.selectedShape.resize(
        x - parentState.selectedShape.x,
        y - parentState.selectedShape.y,
      );

      markerShape.move(
        parentState.selectedShape.x + parentState.selectedShape.width,
        parentState.selectedShape.y + parentState.selectedShape.height,
      );
      context.update();
    }
  }

  @override
  void mouseUp() {
    if (!_isDown) {
      return;
    }

    context.changeState(
      ResizableState(
        selectedShape: parentState.selectedShape,
      ),
    );
    _isDown = false;
  }

  @override
  void onHover() {
    context.cursor = hoverCursor;
  }

  @override
  void onMouseLeave() {
    context.cursor = SystemMouseCursors.basic;
  }

  void render(Canvas canvas) {
    markerShape.paint(canvas);
  }

  @override
  ManipulationContext get context => parentState.context;

  @override
  Shape? findShapeByCoordinates(double x, double y) {
    final rect = Rect.fromLTWH(
      markerShape.x - markerShape.width,
      markerShape.y - markerShape.width,
      markerShape.width * 2,
      markerShape.width * 2,
    );
    return rect.contains(Offset(x, y)) ? markerShape : null;
  }

  @override
  void paint(Canvas canvas) {
    parentState.paint(canvas);
  }

  bool get isDown => _isDown;

  bool _isDown = false;
  String _name = 'MarkerState';

  @override
  String toString() {
    return '$parentState + $_name';
  }
}
