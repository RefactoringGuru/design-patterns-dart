import 'corner_marker.dart';

class TopRightMarkerState extends CornerMarker {
  TopRightMarkerState({
    required super.parentState,
  });
  @override
  void mouseMoveAction(double x, double y) {
    final selectedShape = parentState.selectedShape;
    selectedShape.resize(
      x - selectedShape.x,
      selectedShape.height + selectedShape.y - y,
    );
    selectedShape.move(selectedShape.x, y);
  }

  @override
  void updatePosition() {
    shape.move(
      parentState.selectedShape.x + parentState.selectedShape.width,
      parentState.selectedShape.y,
    );
  }

  @override
  String toString() {
    return '${parentState.toString()} + Top Right Marker State';
  }
}
