import '../shapes/circle.dart';
import '../shapes/compound_shape.dart';
import '../shapes/dot.dart';
import '../shapes/rectangle.dart';

abstract class Visitor {
  void visitCompoundShape(CompoundShape compound);

  void visitDot(Dot dot);

  void visitCircle(Circle circle);

  void visitRectangle(Rectangle rectangle);
}
