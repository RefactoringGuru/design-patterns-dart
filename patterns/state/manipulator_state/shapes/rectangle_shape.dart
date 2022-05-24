import '../states/selections/resizable_state.dart';
import '../states/selections/selection_state.dart';
import 'base_shape.dart';

class RectangleShape extends BaseShape {
  RectangleShape(super.x, super.y, super.width, super.height);

  @override
  SelectionState createSelectionState() {
    return ResizableState(selectedShape: this);
  }
}
