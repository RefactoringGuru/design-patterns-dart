# State Pattern
State is a behavioral design pattern that lets an object alter its behavior when its internal state 
changes. It appears as if the object changed its class.

Tutorial: [here](https://refactoring.guru/design-patterns/state).

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/172001291-8d87a3c8-b694-45c3-bd46-40211cd9ac45.png)

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

### Output:
```
call(1): One
call(2): Two
call(3): Three
call(4): One
```
