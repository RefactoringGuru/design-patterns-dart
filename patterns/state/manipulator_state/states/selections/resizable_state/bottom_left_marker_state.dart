import 'corner_marker.dart';

class BottomLeftMarkerState extends CornerMarker {
  BottomLeftMarkerState({
    required super.parentState,
  });

  @override
  void mouseDragAction(double x, double y) {
    final selectedShape = parentState.selectedShape;
    selectedShape.resize(
      selectedShape.width + selectedShape.x - x,
      y - selectedShape.y,
    );
    selectedShape.move(x, selectedShape.y);
  }

  @override
  void updatePosition() {
    shape.move(
      parentState.selectedShape.x,
      parentState.selectedShape.y + parentState.selectedShape.height,
    );
  }

  @override
  String toString() {
    return '${parentState.toString()} + Bottom Left Marker State';
  }
}
