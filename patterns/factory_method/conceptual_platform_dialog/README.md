# Abstract Factory pattern
Factory Method is a creational design pattern that provides an interface for creating objects in a 
superclass, but allows subclasses to alter the type of objects that will be created.

Tutorial: [here](https://refactoring.guru/design-patterns/factory-method).

### About example.
This the very conceptual example rewrite from original source code [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/main/src/refactoring_guru/factory_method/example)

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/166105090-a2b490fe-3e3e-44f1-a781-9777023020fb.png)

### Client code:
```dart
late Dialog dialog;

void main() {
  configure();
  runBusinessLogic();
}

void configure() {
  if (Platform.isWindows) {
    dialog = WindowsDialog();
  } else {
    dialog = HtmlDialog();
  }
}

void runBusinessLogic() {
  dialog.renderWindow();
}
```

### Output:
```
Windows Button
Click! Button says - "Hello World!"
```
