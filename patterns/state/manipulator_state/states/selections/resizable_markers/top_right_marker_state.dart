import '../../_/marker.dart';

class TopRightMarkerState extends Marker {
  TopRightMarkerState({
    required super.parentState,
  });

  @override
  void mouseDragAction(double x, double y) {
    final width = x - selectedShape.x;
    final height = selectedShape.height + selectedShape.y - y;

    selectedShape
      ..resize(width, height)
      ..move(selectedShape.x, y);
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
