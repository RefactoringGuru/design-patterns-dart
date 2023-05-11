import '../visitor/visitor.dart';

abstract class Shape {
  void accept(Visitor visitor);

  void draw();
}
