# State Pattern
State is a behavioral design pattern that lets an object alter its behavior when its internal state 
changes. It appears as if the object changed its class.

Tutorial: [here](https://refactoring.guru/design-patterns/state).

### Online demo:
Click on the picture to see the [demo](https://RefactoringGuru.github.io/design-patterns-dart/#/state/manipulator_state).

[![image](https://user-images.githubusercontent.com/8049534/171070341-1decb58f-033b-4eb5-89d4-355aafa6b680.png)](https://refactoringguru.github.io/design-patterns-dart/#/state/manipulator_state)

### Video
https://user-images.githubusercontent.com/8049534/171499203-1400c3ae-d5cd-4e48-a0b6-0252f4345d19.mp4

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/171740942-659d3ec9-8355-4078-a7d6-b4a338b41187.png)

## Client code:
### Change FreeState to MoveState:
```dart
class FreeState extends ManipulationState {
  @override
  void mouseDown(double x, double y) {
    tryToSelectAndStartMovingShape(x, y);
  }

  bool tryToSelectAndStartMovingShape(double x, double y) {
    final selectedShape = context.shapes.findShapeByCoordinates(x, y);

    context.changeState(
      MoveState(
        startX: x,
        startY: y,
        selectedShape: selectedShape,
      ),
    );

    return true;
  }
}
```

### Change MoveState to ResizableState:
```dart
class MoveState extends SelectionState {
  @override
  void mouseMove(double x, double y) {
    selectedShape.move(x, y);
    context.update();
  }

  @override
  void mouseUp() {
    context.changeState(
      selectedShape.createSelectionState(),
    );
  }
}
```

### Each shape has its own state manipulator:
```dart
class RectangleShape extends BaseShape {
  @override
  SelectionState createSelectionState() {
    return ResizableState(selectedShape: this);
  }
}

class CircleShape extends BaseShape {
  @override
  SelectionState createSelectionState() {
    return InnerRadiusState(selectedShape: this);
  }
}
```
