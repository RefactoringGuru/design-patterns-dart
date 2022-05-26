part of manipulator;

class BaseManipulator implements Manipulator {
  BaseManipulator({
    required this.shapes,
    required ManipulationState initState,
  }) : _state = initState {
    _state._context = this;
  }

  @override
  final Shapes shapes;

  @override
  final onStateChange = Event();

  @override
  final onUpdate = Event();

  @override
  var cursor = MouseCursor.defer;

  @override
  ManipulationState get state => _state;

  @override
  void changeState(ManipulationState newState) {
    if (_state == newState) {
      return;
    }

    _state = newState;
    _state._context = this;
    onStateChange._emit();
  }

  @override
  void update() {
    onUpdate._emit();
  }

  @override
  void mouseMove(double x, double y) {
    _state.mouseMove(x, y);
  }

  @override
  void mouseDown(double x, double y) {
    _state.mouseDown(x, y);
  }

  @override
  void mouseUp() {
    _state.mouseUp();
  }

  @override
  void keyDown(String key) {
    _state.keyDown(key);
  }

  @override
  void paint(Canvas canvas) {
    _state.paint(canvas);
  }

  @override
  String toString() {
    return _state.toString();
  }

  ManipulationState _state;
}

class Event extends ChangeNotifier {
  void _emit() => notifyListeners();
}
