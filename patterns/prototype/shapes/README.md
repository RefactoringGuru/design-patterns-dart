# Prototype pattern
Prototype is a creational design pattern that lets you copy existing objects without making your 
code dependent on their classes.

## Example
Copies of geometric objects.

**Description:**
https://refactoring.guru/design-patterns/prototype?#pseudocode

### Class Diagram:
![image](https://user-images.githubusercontent.com/8049534/150781031-52c8c32a-e94b-4f1b-86b9-eb0012427682.png)


### Client code:
```dart
void main() {
  final originalShapes = [
    Rectangle(
      x: 100,
      y: 100,
      width: 500,
      height: 100,
      color: '0xfff',
    ),
    Circle(
      x: 20,
      y: 30,
      radius: 100,
      color: '0xf0f',
    ),
  ];

  businessLogic(originalShapes);
}

void businessLogic(List<Shape> originalShapes) {
  final cloningShapes = [
    for (final shape in originalShapes) shape.clone(),
  ];

  print('Origin shapes:  $originalShapes');
  print('Cloning shapes: $cloningShapes');
}
```

**Output:**
```
Origin shapes:  [Rectangle(address: 0x2f7f544c), Circle(address: 0x3e59b487)]
Cloning shapes: [Rectangle(address: 0x3eb0a110), Circle(address: 0x75e3636)]
```
