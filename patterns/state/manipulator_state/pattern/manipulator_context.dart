library manipulator;

import 'package:flutter/material.dart';
import '../app/shapes.dart';

part 'manipulation_state.dart';

class ManipulatorContext {
  final Shapes shapes;

  ManipulationState _state;

  ManipulatorContext({
    required this.shapes,
    required ManipulationState initState,
  }) : _state = initState {
    _state._context = this;
  }

  ManipulationState get state => _state;

  void changeState(ManipulationState newState) {
    if (_state == newState) {
      return;
    }

    _state = newState;
    _state._context = this;
    onStateChange._emit();
  }

  final onStateChange = Event();
  final onUpdate = Event();

  void update(){
    onUpdate._emit();
  }

  void mouseMove(double x, double y) {
    _state.mouseMove(x, y);
  }

  void mouseDown(double x, double y) {
    _state.mouseDown(x, y);
  }

  void mouseUp() {
    _state.mouseUp();
  }

  void keyDown(String key) {
    _state.keyDown(key);
  }

  void paint(Canvas canvas) {
    _state.paint(canvas);
  }
}

class Event extends ChangeNotifier {
  void _emit() => notifyListeners();
}


