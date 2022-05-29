import 'resizable_state/bottom_left_marker_state.dart';
import 'resizable_state/bottom_right_marker_state.dart';
import 'resizable_state/top_left_marker_state.dart';
import 'resizable_state/top_right_marker_state.dart';
import 'sub_states/parent_state.dart';
import '../../shapes/shape.dart';

class ResizableState<T extends Shape> extends ParentState<T> {
  ResizableState({required super.selectedShape}) {
    addMarkers([
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
