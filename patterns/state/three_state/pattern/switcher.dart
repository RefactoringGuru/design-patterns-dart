library switcher;

part 'state.dart';

class Switcher {
  Switcher({required State initState}) {
    changeState(initState);
  }

  int get calls => _calls;

  void call() {
    _calls++;
    _state.call();
  }

  void changeState(State newState) {
    _state = newState;
    _state._context = this;
  }

  late State _state;
  int _calls = 0;
}
