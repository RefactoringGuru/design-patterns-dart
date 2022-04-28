# Memento pattern
Memento is a behavioral design pattern that lets you save and restore the previous state of an 
object without revealing the details of its implementation.

Tutorial: [here](https://refactoring.guru/design-patterns/memento).

### Online demo:
Click on the picture to see the [demo](https://RefactoringGuru.github.io/design-patterns-dart/#/memento/flutter_memento_editor).

[![image](https://user-images.githubusercontent.com/8049534/165401175-88bc4593-4624-45b4-8c03-6f1390ed771a.png)](https://refactoringguru.github.io/design-patterns-dart/#/memento/flutter_memento_editor)

### Dependency Patterns
This complex example includes these implementations:
- [[AppObserver](https://github.com/RefactoringGuru/design-patterns-dart/tree/main/patterns/observer/app_observer)]
- [[SubscriberWidget](https://github.com/RefactoringGuru/design-patterns-dart/tree/main/patterns/observer/subscriber_flutter_widget)]

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/165758516-1de543f5-666d-4e07-958d-2d8fceb73af9.png)

### Client code:
```dart
class MementoEditorApplication {
  final editor = Editor();
  final caretaker = Caretaker();

  void createDefaultShapes() {/*...*/}

  void saveState() {
    final snapshot = editor.backup();

    if (caretaker.isSnapshotExists(snapshot)) {
      return;
    }

    final memento = Memento(DateTime.now(), snapshot);
    caretaker.addMemento(memento);
    editor.events.notify(MementoCreateEvent());
  }

  void restoreState(Memento memento) {
    editor
      ..unSelect()
      ..restore(memento.snapshot)
      ..repaint();
  }
}
```
