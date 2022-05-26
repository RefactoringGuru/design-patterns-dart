import 'bottom_left_marker_state.dart';
import 'bottom_right_marker_state.dart';
import 'top_left_marker_state.dart';
import 'top_right_marker_state.dart';
import '../sub_states/parent_state.dart';

class ResizableState extends ParentState {
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
