part of manipulator;

class ManipulationState {
  ManipulatorContext? _context;

  ManipulatorContext get context => _context!;

  void mouseMove(double x, double y) {}

  void mouseDown(double x, double y) {}

  void mouseUp() {}

  void keyDown(String key) {}

  void paint(Canvas canvas) {}
}
