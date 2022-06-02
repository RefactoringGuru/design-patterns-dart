import 'resizable_markers/bottom_left_marker_state.dart';
import 'resizable_markers/bottom_right_marker_state.dart';
import 'resizable_markers/top_left_marker_state.dart';
import 'resizable_markers/top_right_marker_state.dart';
import '../_/sub_states/parent_state.dart';
import '../../shapes/shape.dart';

class ResizableState<T extends Shape> extends ParentState<T> {
  ResizableState({required super.selectedShape}) {
    addChildren([
      TopLeftMarkerState(parentState: this),
      TopRightMarkerState(parentState: this),
      BottomRightMarkerState(parentState: this),
      BottomLeftMarkerState(parentState: this),
    ]);
  }

  @override
  String toString() {
    return '${super.toString()} + Resizable State';
  }
}
