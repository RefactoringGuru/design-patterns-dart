import 'concrete_builder/concrete_builder_1.dart';
import 'concrete_builder/concrete_builder_2.dart';
import 'pattern/director.dart';

void main() {
  final director = Director();

  final product1 = director.construct(ConcreteBuilder1());
  print(product1);

  final product2 = director.construct(ConcreteBuilder2());
  print(product2);
}
