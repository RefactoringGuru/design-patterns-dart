import 'dart:ui';

import '../sub_states/child_state.dart';
import '../selection_state.dart';

class ParentState extends SelectionState {
  ParentState({
    required super.selectedShape,
  });

  void addMarkers(List<ChildState> markers) {
    _markers.addAll(markers);
  }

  @override
  void mouseDown(double x, double y) {
    for (final marker in _markers) {
      marker.mouseDown(x, y);
      if (context.state == marker) {
        return;
      }
    }

    super.mouseDown(x, y);
  }

  @override
  void mouseMove(double x, double y) {
    super.mouseMove(x, y);

    for (final marker in _markers) {
      marker.mouseMove(x, y);
      if (marker.isHover) {
        return;
      }
    }
  }

  @override
  void paint(Canvas canvas) {
    super.paint(canvas);

    for (final marker in _markers) {
      context.paintStyle.paintMarker(canvas, marker.shape);
    }
  }

  @override
  void updateMarkers() {
    for (final marker in _markers) {
      marker.updatePosition();
    }
  }

  final _markers = <ChildState>[];
}
