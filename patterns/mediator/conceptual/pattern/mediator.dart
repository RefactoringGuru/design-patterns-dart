library mediator;

part 'component.dart';

abstract class Mediator {
  void notify(Component component, String event);

  void applyThisMediator(Component component) {
    component._mediator = this;
  }
}
