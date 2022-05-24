import 'dart:ui';

import '../../pattern/manipulator_context.dart';
import '../../shapes/shape.dart';
import '../hover_state_mixin.dart';
import '../selections/selection_state.dart';
import '../specific_actions_mixin.dart';

abstract class CreationState extends ManipulationState
    with SpecificActionsMixin, HoverStateMixin {
  var _startX = 0.0;
  var _startY = 0.0;
  Shape? _newShape;
  var _isDragged = false;

  @override
  bool mouseDown(double x, double y) {
    _startX = x;
    _startY = y;
    _newShape = createShape(x, y);
    return true;
  }

  @override
  void mouseMove(double x, double y) {
    if (_newShape == null) {
      super.mouseMove(x, y);
      return;
    }

    _isDragged = true;
    _newShape!.resize(x - _startX, y - _startY);
    context.update();
  }

  @override
  void mouseUp() {
    if (_newShape == null) {
      return;
    }

    if (!_isDragged) {
      _newShape!.move(_startX - 50, _startY - 50);
      _newShape!.resize(100, 100);
    }

    context.shapes.add(_newShape!);
    context.changeState(
      SelectionState(
        selectedShape: _newShape!,
      ),
    );

    _isDragged = false;
    _newShape = null;
  }

  @override
  void paint(Canvas canvas) {
    _newShape?.paint(canvas);
    super.paint(canvas);
  }

  Shape createShape(double x, double y);
}
