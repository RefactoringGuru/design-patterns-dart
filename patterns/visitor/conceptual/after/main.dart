import 'elements/one.dart';
import 'elements/three.dart';
import 'elements/two.dart';
import 'operations/concrete_visitor1.dart';
import 'operations/concrete_visitor2.dart';
import 'pattern/element.dart';
import 'pattern/visitor.dart';

void main() {
  final list = createElements();
  operation(list, ConcreteVisitor1());
  operation(list, ConcreteVisitor2());
}

Iterable<Element> createElements() {
  return [
    One(),
    Two(),
    Three(),
  ];
}

void operation(Iterable<Element> elements, Visitor visitor) {
  for (final e in elements) {
    e.accept(visitor);
  }
}
