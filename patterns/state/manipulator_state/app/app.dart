import '../pattern/manipulator_context.dart';
import 'shapes.dart';
import 'tool.dart';

class App {
  final Shapes shapes;
  final ManipulatorContext manipulator;
  final List<Tool> tools;

  App({
    required this.shapes,
    required this.manipulator,
    required this.tools,
  });
}
