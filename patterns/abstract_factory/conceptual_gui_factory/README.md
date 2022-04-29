# Abstract Factory pattern
Abstract Factory is a creational design pattern that lets you produce families of related objects 
without specifying their concrete classes.

Tutorial: [here](https://refactoring.guru/design-patterns/abstract-factory).

### About example.
This the very conceptual example rewrite from original source code [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/main/src/refactoring_guru/abstract_factory/example)

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/165987890-e64db9a3-4865-411c-a5c0-16da21043159.png)

### Client code:
```dart
void main() {
  final guiFactory = GUIFactory();
  final app = Application(guiFactory);
  app.paint();
}

abstract class GUIFactory {
  factory GUIFactory() {
    if (Platform.isMacOS) {
      return MacOSFactory();
    } else {
      return WindowsFactory();
    }
  }
  
  /*...*/
}
```

### Output:
```
You have created WindowsButton.
You have created WindowsCheckbox.
```
