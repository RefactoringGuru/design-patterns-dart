import 'corner_marker.dart';

class BottomRightMarkerState extends CornerMarker {
  BottomRightMarkerState({
    required super.parentState,
  });

  @override
  void mouseMoveAction(double x, double y) {
    final parentShape = parentState.selectedShape;
    parentShape.resize(
      x - parentShape.x,
      y - parentShape.y,
    );
  }

  @override
  void updatePosition() {
    final parentShape = parentState.selectedShape;
    shape.move(
      parentShape.x + parentState.selectedShape.width,
      parentState.selectedShape.y + parentState.selectedShape.height,
    );
  }

  @override
  String toString() {
    return '${parentState.toString()} + Bottom Right Marker State';
  }
}
