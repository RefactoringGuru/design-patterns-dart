part of switcher;

abstract class State {
  Switcher get context => _context;

  void call();

  late Switcher _context;
}
