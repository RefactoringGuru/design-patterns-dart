import '../../_/marker.dart';

class BottomLeftMarkerState extends Marker {
  BottomLeftMarkerState({
    required super.parentState,
  });

  @override
  void mouseDragAction(double x, double y) {
    final newX = selectedShape.width + selectedShape.x - x;
    final newY = y - selectedShape.y;

    selectedShape
      ..resize(newX, newY)
      ..move(x, selectedShape.y);
  }

  @override
  void updatePosition() {
    markerShape.move(
      selectedShape.x,
      selectedShape.y + selectedShape.height,
    );
  }

  @override
  String toString() {
    return '${parentState.toString()} + Bottom Left Marker State';
  }
}
