# State Pattern
State is a behavioral design pattern that lets an object alter its behavior when its internal state 
changes. It appears as if the object changed its class.

Tutorial: [here](https://refactoring.guru/design-patterns/state).

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/172000870-a96c6dd2-5b6a-4a64-b3a9-4edb75dd8076.png)

### Client code:
```dart
void main() {
  final switcher = Switcher(
    initState: One(),
  );

  switcher.call(); // call(1): One
  switcher.call(); // call(2): Two
  switcher.call(); // call(3): Three
  switcher.call(); // call:(4) One
}
```
