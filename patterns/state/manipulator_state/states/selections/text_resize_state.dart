import 'dart:ui';

import '../../shapes/text_shape.dart';
import '../_/sub_states/parent_state.dart';
import 'text_edit_state.dart';
import 'text/text_size_marker_state.dart';

class TextResizeState extends ParentState<TextShape> {
  TextResizeState({required super.selectedShape}) {
    addChildren([
      TextSizeMarkerState(parentState: this),
    ]);
  }

  @override
  void mouseDoubleClick(double x, double y) {
    context.changeState(
      TextEditState(
        startPointer: Offset(x, y),
        selectedShape: selectedShape,
      ),
    );
  }

  @override
  String toString() {
    return '${super.toString()} + Text Resize State';
  }
}
