part of manipulator;

class ManipulationState {
  ManipulationContext get context => _context!;

  void mouseMove(double x, double y) {}

  void mouseDown(double x, double y) {}

  void mouseUp() {}

  void keyDown(String key) {}

  void paint(Canvas canvas) {}

  void updateChildrenStates() {}

  ManipulationContext? _context;
}
