import '../../_/corner_marker.dart';

class TopRightMarkerState extends CornerMarker {
  TopRightMarkerState({
    required super.parentState,
  });

  @override
  void mouseDragAction(double x, double y) {
    final newX = x - selectedShape.x;
    final newY = selectedShape.height + selectedShape.y - y;

    selectedShape.resize(newX, newY);
    selectedShape.move(selectedShape.x, newY);
  }

  @override
  void updatePosition() {
    markerShape.move(
      selectedShape.x + selectedShape.width,
      selectedShape.y,
    );
  }

  @override
  String toString() {
    return '${parentState.toString()} + Top Right Marker State';
  }
}
