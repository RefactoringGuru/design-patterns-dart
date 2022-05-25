import 'dart:ui';

import 'package:flutter/services.dart';

import '../../../shapes/marker_shape.dart';
import '../../../shapes/shape.dart';
import '../../../pattern/manipulation_context.dart';
import '../../mixins/hover_state_mixin.dart';
import '../resizable_state.dart';

class MarkerState extends ManipulationState with HoverStateMixin {
  final ResizableState parentState;
  late final Shape markerShape;
  final MouseCursor hoverCursor;

  MarkerState({
    required Offset Function() updatePosition,
    required this.mouseEffect,
    required this.hoverCursor,
    required this.parentState,
  })  : markerShape = MarkerShape(),
        _updatePosition = updatePosition {
    this.updatePosition();
  }

  factory MarkerState.topLeft(ResizableState parentState) {
    return MarkerState(
      updatePosition: () => Offset(
        parentState.selectedShape.x,
        parentState.selectedShape.y,
      ),
      mouseEffect: (double x, double y) => parentState.selectedShape.resize(
        x - parentState.selectedShape.x,
        y - parentState.selectedShape.y,
      ),
      hoverCursor: SystemMouseCursors.resizeUpLeft,
      parentState: parentState,
    ).._name = 'MarkerState.topLeft';
  }

  factory MarkerState.topRight(ResizableState parentState) {
    return MarkerState(
      updatePosition: () => Offset(
        parentState.selectedShape.x + parentState.selectedShape.width,
        parentState.selectedShape.y,
      ),
      mouseEffect: (double x, double y) => parentState.selectedShape.resize(
        x - parentState.selectedShape.x,
        y - parentState.selectedShape.y,
      ),
      hoverCursor: SystemMouseCursors.resizeUpRight,
      parentState: parentState,
    ).._name = 'MarkerState.topRight';
  }

  factory MarkerState.bottomRight(ResizableState parentState) {
    return MarkerState(
      updatePosition: () => Offset(
        parentState.selectedShape.x + parentState.selectedShape.width,
        parentState.selectedShape.y + parentState.selectedShape.height,
      ),
      mouseEffect: (double x, double y) => parentState.selectedShape.resize(
        x - parentState.selectedShape.x,
        y - parentState.selectedShape.y,
      ),
      hoverCursor: SystemMouseCursors.resizeDownRight,
      parentState: parentState,
    ).._name = 'MarkerState.bottomRight';
  }

  factory MarkerState.bottomLeft(ResizableState parentState) {
    return MarkerState(
      updatePosition: () => Offset(
        parentState.selectedShape.x,
        parentState.selectedShape.y + parentState.selectedShape.height,
      ),
      mouseEffect: (double x, double y) {
        parentState.selectedShape.move(x, parentState.selectedShape.y);
      },
      hoverCursor: SystemMouseCursors.resizeDownLeft,
      parentState: parentState,
    ).._name = 'MarkerState.bottomLeft';
  }

  void updatePosition() {
    final p = _updatePosition();
    markerShape.move(p.dx, p.dy);
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
      mouseEffect.call(x, y);
      parentState.updateMarkersPosition();
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

  final void Function(double x, double y) mouseEffect;
  final Offset Function() _updatePosition;
  bool _isDown = false;
  String _name = 'MarkerState';

  @override
  String toString() {
    return '$parentState + $_name';
  }
}
