part of manipulator;

class ManipulationState {
  Manipulator get context => _context;

  void init() {}

  void mouseMove(double x, double y) {}

  void mouseDown(double x, double y) {}

  void mouseUp() {}

  void mouseDoubleClick(double x, double y) {}

  void keyDown(KeyEvent keyEvent) {}

  void paint(Canvas canvas) {}

  late Manipulator _context;
}
