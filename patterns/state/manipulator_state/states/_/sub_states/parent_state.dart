import 'dart:ui';

import '../../selections/selection_state.dart';
import 'child_state.dart';
import '../../../shapes/shape.dart';

abstract class ParentState<T extends Shape> extends SelectionState<T> {
  ParentState({
    required super.selectedShape,
  });

  void addChildren(List<ChildState> markers) {
    _children.addAll(markers);
  }

  void updateKids() {
    for (final child in _children) {
      child.updatePosition();
    }
  }

  @override
  void mouseDown(double x, double y) {
    for (final child in _children) {
      child.mouseDown(x, y);
      if (context.state == child) {
        return;
      }
    }

    super.mouseDown(x, y);
  }

  @override
  void mouseMove(double x, double y) {
    super.mouseMove(x, y);

    for (final child in _children) {
      child.mouseMove(x, y);
      if (child.isHover) {
        return;
      }
    }
  }

  @override
  void paint(Canvas canvas) {
    super.paint(canvas);

    for (final child in _children) {
      context.paintStyle.paintMarker(canvas, child.markerShape);
    }
  }

  final _children = <ChildState>[];
}
