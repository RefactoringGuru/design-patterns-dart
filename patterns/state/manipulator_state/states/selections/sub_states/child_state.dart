import 'dart:ui';

import 'package:flutter/services.dart';

import '../../../shapes/shape.dart';
import '../../../pattern/manipulation_context.dart';
import '../../mixins/hover_state_mixin.dart';
import '../selection_state.dart';

abstract class ChildState extends ManipulationState with HoverStateMixin {
  final SelectionState parentState;
  final Shape markerShape;
  final MouseCursor hoverCursor;

  ChildState({
    required this.parentState,
    required this.markerShape,
    this.hoverCursor = SystemMouseCursors.basic,
  }) {
    updatePosition();
  }

  void updatePosition();

  void mouseMoveAction(double x, double y);

  void render(Canvas canvas) {
    markerShape.paint(canvas);
  }

  @override
  void onHover() {
    context.cursor = hoverCursor;
  }

  @override
  void onMouseLeave() {
    context.cursor = SystemMouseCursors.basic;
  }

  @override
  void mouseDown(double x, double y) {
    if (isHover) {
      _isDown = true;
    }
  }

  @override
  void mouseMove(double x, double y) {
    super.mouseMove(x, y);
    if (_isDown) {
      mouseMoveAction(x, y);
      parentState.updateChildrenStates();
      context.update();
    }
  }

  @override
  void mouseUp() {
    if (!_isDown) {
      return;
    }

    context.changeState(
      parentState,
    );
    _isDown = false;
  }

  @override
  void paint(Canvas canvas) {
    parentState.paint(canvas);
  }

  @override
  ManipulationContext get context => parentState.context;

  @override
  Shape? findShapeByCoordinates(double x, double y) {
    return markerShape.rect.contains(Offset(x, y)) ? markerShape : null;
  }

  bool get isDown => _isDown;

  bool _isDown = false;
}
