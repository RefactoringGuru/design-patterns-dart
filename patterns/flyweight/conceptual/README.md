# Flyweight Pattern
Flyweight is a structural design pattern that lets you fit more objects into the available amount of
 RAM by sharing common parts of state between multiple objects instead of keeping all of the data in
  each object.

Tutorial: [here](https://refactoring.guru/design-patterns/flyweight).

### Conceptual Diagram:
![Flyweight Pattern Diagram](https://user-images.githubusercontent.com/8049534/174476638-007f3179-495f-499d-8f35-e33956d4890b.png)

### Client code:
```dart
void main() {
  final factory = FlyweightFactory();

  final one = factory.create('one');
  one.draw();

  final ONE = factory.create('ONE');
  ONE.draw();

  final OnE = factory.create('OnE');
  OnE.draw();

  final two = factory.create('two');
  two.draw();

  final Two = factory.create('Two');
  Two.draw();
}
```

### Output:
```
Flyweight(
	localParam: "one", shareParam: (61, "b", 0.19)
)
Flyweight(
	localParam: "ONE", shareParam: (61, "b", 0.19)
)
Flyweight(
	localParam: "OnE", shareParam: (61, "b", 0.19)
)
Flyweight(
	localParam: "two", shareParam: (53, "e", 0.55)
)
Flyweight(
	localParam: "Two", shareParam: (53, "e", 0.55)
)
```
