part of manipulator;

class BaseManipulator implements Manipulator {
  BaseManipulator({
    required this.shapes,
    required ManipulationState initState,
    required this.paintStyle,
  }) : _state = initState {
    _state._context = this;
  }

  @override
  ManipulationState get state => _state;

  @override
  final Shapes shapes;

  @override
  final onStateChange = Event();

  @override
  final onUpdate = Event();

  @override
  var cursor = MouseCursor.defer;

  @override
  final PaintStyle paintStyle;

  @override
  void changeState(ManipulationState newState) {
    if (_state == newState) {
      return;
    }

    _state = newState;
    _state._context = this;
    _state.init();
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
  void mouseDoubleClick(double x, double y) {
    _state.mouseDoubleClick(x, y);
  }

  @override
  void keyDown(KeyEvent keyEvent) {
    _state.keyDown(keyEvent);
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
