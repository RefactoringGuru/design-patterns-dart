import 'selection_state.dart';

class MovingState extends SelectionState {
  final double startX;
  final double startY;

  MovingState({
    required double startX,
    required double startY,
    required super.selectedShape,
  })  : startX = startX - selectedShape.x,
        startY = startY - selectedShape.y;

  @override
  void mouseMove(double x, double y) {
    selectedShape.move(x - startX, y - startY);
    context.update();
  }

  @override
  void mouseUp() {
    context.changeState(
      selectedShape.createSelectionState(),
    );
  }

  @override
  String toString() {
    return '${super.toString()} + Moving State';
  }
}
