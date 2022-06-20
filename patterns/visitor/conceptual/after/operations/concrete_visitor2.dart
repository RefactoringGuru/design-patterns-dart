import '../elements/one.dart';
import '../elements/three.dart';
import '../elements/two.dart';
import '../pattern/visitor.dart';

class ConcreteVisitor2 implements Visitor {
  @override
  void visitOne(One one) {
    print('operation2: one (param1 = ${one.param1})');
  }

  @override
  void visitTwo(Two two) {
    print('operation2: two (param2 = ${two.param2})');
  }

  @override
  void visitThree(Three three) {
    print('operation2: three (param3 = ${three.param3})');
  }
}
