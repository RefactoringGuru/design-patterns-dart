import '../app/tools.dart';
import 'shapes.dart';

class App {
  final Tools tools;
  final Shapes shapes;

  App({
    required this.tools,
    required this.shapes,
  });

  void addShape(double x, double y) {
    final activeColor = tools.activeColor.value;
    final activeFactory = tools.activeFactory.value;

    final newShape = activeFactory.createShape(x, y, activeColor);
    newShape.centerToFit();
    shapes.add(newShape);
  }
}
