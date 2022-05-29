part of manipulator;

class ManipulationState {
  Manipulator get context => _context;

  void mouseMove(double x, double y) {}

  void mouseDown(double x, double y) {}

  void mouseUp() {}

  void keyDown(String key) {}

  void paint(Canvas canvas) {}

  late Manipulator _context;
}
