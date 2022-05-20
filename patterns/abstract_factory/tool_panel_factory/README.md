# Abstract Factory Pattern
Abstract Factory is a creational design pattern that lets you produce families of related objects 
without specifying their concrete classes.

Tutorial: [here](https://refactoring.guru/design-patterns/abstract-factory).

### Online demo:
Click on the picture to see the [demo](https://RefactoringGuru.github.io/design-patterns-dart/#/abstract_factory/tool_panel_factory).

[![image](https://user-images.githubusercontent.com/8049534/169530318-0ce7ee6a-3538-4398-a2ab-e6e85f2132b5.png)](https://refactoringguru.github.io/design-patterns-dart/#/abstract_factory/tool_panel_factory)

### About
![image](https://user-images.githubusercontent.com/8049534/169521422-052cc59a-7b3d-4889-8d76-5664a75b271a.png)

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/169528461-d7c5279d-7e7f-4ce7-b8d2-87388ec2d32f.png)

### Client code:
```dart
class App {
  void addShape(double x, double y) {
    final newShape = activeToolFactory.createShape(x, y, activeColor);
    shapes.add(newShape);
  }
}


class PropertyPanel extends StatelessWidget {
  final PropertyWidgetFactories factories;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: propertyWidgetFactories
            .createListWidgetsFrom(activeToolFactory.properties)
            .toList(),
      );
  }
}
```
