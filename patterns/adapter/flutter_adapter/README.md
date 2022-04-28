
# Adapter pattern
Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate.

Tutorial: [here](https://refactoring.guru/design-patterns/observer).

## Example: Flutter classic application adapter widget 
This example shows how to adapt a non-reactive classic type application for Flutter.

### Dependency
This complex example includes these implementations:
- [[AppObserver](https://github.com/RefactoringGuru/design-patterns-dart/tree/main/patterns/observer/app_observer)]
- [[SubscriberWidget](https://github.com/RefactoringGuru/design-patterns-dart/tree/main/patterns/observer/subscriber_flutter_widget)]

### Online demo:
Click on the picture to see a [demo](https://refactoringguru.github.io/design-patterns-dart/#/adapter/flutter_adapter).

[![image](https://user-images.githubusercontent.com/8049534/152689272-d4bed484-e216-4eda-8833-928ada7d4051.png)](https://refactoringguru.github.io/design-patterns-dart/#/adapter/flutter_adapter)

### Client code:
```dart
// classic application
class App extends ClassicApp {
  @override
  void onPointerWheel(double deltaX, double deltaY) {
    // ...
  }

  @override
  void onMouseDown() {
    // ...
    repaint();
  }

  @override
  void onPaint(Canvas canvas, Size canvasSize) {
    //...
  }
}

void main() {
  // adapting a classic application to a flutter widget tree
  ClassicAppAdapterWidget(
    classicApp: app,
  );
}
```

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/152753162-1b9006ad-a633-4132-91b6-bb348559adec.png)

### Sequence [Classic application -> Change Text color]
When user clicked to "Flutter Adapter" text. 

![image](https://user-images.githubusercontent.com/8049534/152753714-84af5abd-85c0-4845-af2d-616f512ef633.png)

### Sequence [Flutter Widget -> Change Text color]
When the user has selected a color in the color bar.

![image](https://user-images.githubusercontent.com/8049534/152753870-edeab3ae-8e79-4e9d-9049-7cd5a2100afa.png)
