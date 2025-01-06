import '../components/component1.dart';
import '../components/component2.dart';
import '../pattern/mediator.dart';

class ConcreteMediator extends Mediator {
  final Component1 component1;
  final Component2 component2;

  ConcreteMediator(this.component1, this.component2) {
    applyThisMediator(component1);
    applyThisMediator(component2);
  }

  @override
  void notify(Component component, String event) {
    print('ConcreteMediator.notify(event: "$event")');

    if (component == component1) {
      reactComponentOne();
    } else if (component == component2) {
      reactComponentTwo();
    }
  }

  void reactComponentOne() {
    print('ConcreteMediator.reactComponentOne()');
    print('use component2.name = "${component2.name}"');
  }

  void reactComponentTwo() {
    print('ConcreteMediator.reactComponentTwo()');
    print('use component1.sate = "${component1.sate}"');
  }
}
