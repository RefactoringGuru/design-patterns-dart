import 'components/component1.dart';
import 'components/component2.dart';
import 'concrete_mediator/concrete_mediator.dart';

void main() {
  final component1 = Component1();
  final component2 = Component2();

  ConcreteMediator(component1, component2);

  component1.doOne();
  print('');
  component2.doTwo();
}
