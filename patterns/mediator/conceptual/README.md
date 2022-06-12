# Mediator Pattern
Mediator is a behavioral design pattern that lets you reduce chaotic dependencies between objects. 
The pattern restricts direct communications between the objects and forces them to collaborate only 
via a mediator object.

Tutorial: [here](https://refactoring.guru/design-patterns/mediator).

## Conceptual diagram:
![image](https://user-images.githubusercontent.com/8049534/173237874-971dd4e7-2e74-4cac-bcea-77b88255adad.png)

### Client code:
```dart
void main() {
  final component1 = Component1();
  final component2 = Component2();

  ConcreteMediator(component1, component2);

  component1.doOne();
  print('');
  component2.doTwo();
}
```

### Output:
```
call Component1.doOne()
ConcreteMediator.notify(event: "doOne")
ConcreteMediator.reactComponentOne()
use component2.name = "Two"

call Component2.doTwo()
ConcreteMediator.notify(event: "doTwo")
ConcreteMediator.reactComponentTwo()
use component1.sate = "Cmp1"
```

