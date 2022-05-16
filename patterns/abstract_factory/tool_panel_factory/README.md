# Abstract Factory Pattern
Abstract Factory is a creational design pattern that lets you produce families of related objects 
without specifying their concrete classes.

Tutorial: [here](https://refactoring.guru/design-patterns/abstract-factory).

### Online demo:
Click on the picture to see the [demo](https://RefactoringGuru.github.io/design-patterns-dart/#/abstract_factory/tool_panel_factory).

[![image](https://user-images.githubusercontent.com/8049534/168668992-369a1bab-9f97-4333-a20e-ffd06bf91b54.png)](https://refactoringguru.github.io/design-patterns-dart/#/abstract_factory/tool_panel_factory)

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/168672053-73ae1c9c-8fad-45ae-9247-429f7b5da565.png)

### Client code (using the "createShape" method):
```dart
final app = App(
  tools: Tools(
    factories: [
      TxtFactory(),
      LineFactory(),
      CircleFactory(),
      TriangleFactory(),
      StarFactory(),
    ],
  ),
);

class App {
  void addShape(double x, double y) {
    final newShape = activeFactory.createShape(x, y, activeColor);
    shapes.add(newShape);
  }
}

mixin IconBoxMixin implements FactoryTool {
  Image? _icon;

  @override
  Image get icon => _icon!;

  Future<void> updateIcon(Color color) async {
    final shape = createShape(0, 0, color);
    final pngBytes = await _pngImageFromShape(shape);
    _icon = Image.memory(pngBytes);
  }
}
```

