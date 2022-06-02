import '../../_/marker.dart';

class TopLeftMarkerState extends Marker {
  TopLeftMarkerState({
    required super.parentState,
  });

  @override
  void mouseDragAction(double x, double y) {
    final newWidth = selectedShape.width + selectedShape.x - x;
    final newHeight = selectedShape.height + selectedShape.y - y;

    selectedShape
      ..resize(newWidth, newHeight)
      ..move(x, y);
  }

  @override
  void updatePosition() {
    markerShape.move(
      selectedShape.x,
      selectedShape.y,
    );
  }

  @override
  String toString() {
    return '${parentState.toString()} + Top Left Marker State';
  }
}
