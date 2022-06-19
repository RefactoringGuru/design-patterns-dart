import '../elements/one.dart';
import '../elements/three.dart';
import '../elements/two.dart';
import '../pattern/visitor.dart';

class ConcreteVisitor1 implements Visitor {
  @override
  void visitOne(One one) {
    print('operation1: one (param1 = ${one.param1})');
  }

  @override
  void visitTwo(Two two) {
    print('operation1: two (param2 = ${two.param2})');
  }

  @override
  void visitThree(Three three) {
    print('operation1: three (param3 = ${three.param3})');
  }
}
