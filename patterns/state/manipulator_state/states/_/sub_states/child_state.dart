import 'dart:ui';

import 'package:flutter/services.dart';

import '../../../shapes/shape.dart';
import '../../../pattern/manipulator.dart';
import '../../_/mixins/hover_shape_mixin.dart';
import 'parent_state.dart';

abstract class ChildState<T extends Shape> extends ManipulationState
    with HoverShapeMixin {
  final ParentState<T> parentState;
  final Shape markerShape;

  ChildState({
    required this.parentState,
    required this.markerShape,
  }) {
    updatePosition();
  }

  void updatePosition();

  void mouseDragAction(double x, double y);

  MouseCursor get hoverCursor;

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
      context.changeState(this);
    }
  }

  @override
  void mouseMove(double x, double y) {
    super.mouseMove(x, y);
    if (_isDown) {
      mouseDragAction(x, y);
      parentState.updateKids();
      context.cursor = hoverCursor;
      context.update();
    }
  }

  @override
  void mouseUp() {
    if (!_isDown) {
      return;
    }

    context.changeState(parentState);
    _isDown = false;

    if (!isHover) {
      context.cursor = SystemMouseCursors.basic;
      context.update();
    }
  }

  @override
  void paint(Canvas canvas) {
    parentState.paint(canvas);
  }

  @override
  Manipulator get context => parentState.context;

  @override
  Shape? findShapeByCoordinates(double x, double y) {
    return markerShape.rect.contains(Offset(x, y)) ? markerShape : null;
  }

  bool get isDown => _isDown;

  bool _isDown = false;
}
