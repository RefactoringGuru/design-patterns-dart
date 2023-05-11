# Strategy pattern
Strategy is a behavioral design pattern that lets you define a family of algorithms, put each of 
them into a separate class, and make their objects interchangeable.

Tutorial: [here](https://refactoring.guru/design-patterns/strategy).

## About example: Reservation cargo spaces. 
This example is taken from the "Blue" book **"Domain-Driven Design" - Eric Evans. Chapter Once**.

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/166560051-6e392b01-6777-4eb1-ae20-fcd643b248ef.png)

### Client code:
```dart
void main() {
  final overbookingPolicy = OverbookingPolicy();
  final app = Application(overbookingPolicy);
  final voyage = Voyage();

  try {
    app.makeBooking(Cargo(1000), voyage);
    app.makeBooking(Cargo(500), voyage);
    app.makeBooking(Cargo(800), voyage); // error
  } catch (e) {
    print(e);
  }
}

class Application {
  void makeBooking(Cargo cargo, Voyage voyage) {
    if (overbookingPolicy.isAllowed(cargo, voyage)) {
      voyage.addCargo(cargo, confirmation);
    } 
  }
}
```

**Output:**
```
add Cargo(1000.0) to voyage.
add Cargo(500.0) to voyage.
The weight of the cargo exceeds the permissible norm.
```
