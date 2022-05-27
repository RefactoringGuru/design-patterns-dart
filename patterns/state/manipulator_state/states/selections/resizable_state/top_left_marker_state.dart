import 'corner_marker.dart';

class TopLeftMarkerState extends CornerMarker {
  TopLeftMarkerState({
    required super.parentState,
  });

  @override
  void mouseDragAction(double x, double y) {
    parentState.selectedShape.resize(
      parentState.selectedShape.width + parentState.selectedShape.x - x,
      parentState.selectedShape.height + parentState.selectedShape.y - y,
    );
    parentState.selectedShape.move(x, y);
  }

  @override
  void updatePosition() {
    shape.move(parentState.selectedShape.x, parentState.selectedShape.y);
  }

  @override
  String toString() {
    return '${parentState.toString()} + Top Left Marker State';
  }
}
