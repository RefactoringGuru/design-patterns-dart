import '../pattern/manipulator.dart';
import 'shapes.dart';
import 'tool.dart';

class App {
  final Shapes shapes;
  final Manipulator manipulator;
  final List<Tool> tools;

  App({
    required this.shapes,
    required this.manipulator,
    required this.tools,
  });
}
