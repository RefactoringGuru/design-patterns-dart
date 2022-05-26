import 'sub_states/parent_state.dart';
import 'sub_states/top_right_marker_state.dart';

class ResizableState extends ParentState {
  ResizableState({required super.selectedShape}) {
    addMarkers([
      TopRightMarkerState(parentState: this),
    ]);
  }

  @override
  String toString() {
    return '${super.toString()} + Resizable State';
  }
}
