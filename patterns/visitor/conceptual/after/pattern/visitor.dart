import '../elements/one.dart';
import '../elements/three.dart';
import '../elements/two.dart';

abstract class Visitor {
  void visitOne(One one);

  void visitTwo(Two two);

  void visitThree(Three three);
}
