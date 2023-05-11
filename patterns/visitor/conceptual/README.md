# Visitor pattern
Visitor is a behavioral design pattern that lets you separate algorithms from the objects on which 
they operate.

Tutorial: [here](https://refactoring.guru/design-patterns/visitor).

### About example.

## Client code:
### Before:
```dart
void main() {
  final list = createElements();
  list.forEach(operation1);
}

Iterable<Object> createElements() {
  return [
    One(),
    Two(),
    Three(),
  ];
}

void operation1(Object obj) {
  if (obj is One) {
    print('operation1: one (param1 = ${obj.param1})');
  } else if (obj is Two) {
    print('operation1: two (param2 = ${obj.param2})');
  } else if (obj is Three) {
    print('operation1: two (param3 = ${obj.param3})');
  }
}
```

### After:
```dart
void main() {
  final list = createElements();

  for (final e in elements) {
    e.accept(visitor);
  }
}

Iterable<Object> createElements() {
  return [
    One(),
    Two(),
    Three(),
  ];
}

class ConcreteVisitor1 implements Visitor {
  @override
  void visitOne(One one) {
    print('operation1: one (param1 = ${one.param1})');
  }

  @override
  void visitTwo(Two two) {
    print('operation1: two (param2 = ${two.param2})');
  }

  @override
  void visitThree(Three three) {
    print('operation1: three (param3 = ${three.param3})');
  }
}
```
#### Diagram:
![image](https://user-images.githubusercontent.com/8049534/174583542-5f57463c-148b-4113-acd3-2814ec017ecc.png)

### Output:
```
operation1: one (param1 = 1)
operation1: two (param2 = 2)
operation1: three (param3 = 3)
operation2: one (param1 = 1)
operation2: two (param2 = 2)
operation2: three (param3 = 3)
```
