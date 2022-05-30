import '../../shapes/text_shape.dart';
import '../_/sub_states/parent_state.dart';
import 'text_resize_marker/text_resize_marker_state.dart';

class TextResizeState extends ParentState<TextShape> {
  TextResizeState({required super.selectedShape}) {
    addChildren([
      TextSizeMarkerState(parentState: this),
    ]);
  }

  @override
  String toString() {
    return '${super.toString()} + Text Resize State';
  }
}
