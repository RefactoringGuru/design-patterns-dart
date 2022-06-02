import '../../_/marker.dart';

class BottomRightMarkerState extends Marker {
  BottomRightMarkerState({
    required super.parentState,
  });

  @override
  void mouseDragAction(double x, double y) {
    selectedShape.resize(
      x - selectedShape.x,
      y - selectedShape.y,
    );
  }

  @override
  void updatePosition() {
    final width = selectedShape.x + selectedShape.width;
    final height = selectedShape.y + selectedShape.height;
    markerShape.move(width, height);
  }

  @override
  String toString() {
    return '${parentState.toString()} + Bottom Right Marker State';
  }
}
