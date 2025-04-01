# Observer pattern
Observer is a behavioral design pattern that lets you define a subscription mechanism to notify 
multiple objects about any events that happen to the object they’re observing.

## Editor example 
In this example, the Observer pattern lets the text editor object notify other service objects about 
changes in its state.

More detailed explanation on [RefactoringGuru](https://refactoring.guru/design-patterns/observer?#pseudocode).

### Origin source code:
This example rewrite from [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/main/src/refactoring_guru/observer/example).

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/150955865-7fbb29f3-ed48-4317-a356-cbb9cc79ed11.png)

### Client code:
```dart
void main() {
  final editor = Editor();
  editor.events
    ..subscribe(
      'open',
      LogOpenListener('log.txt'),
    )
    ..subscribe(
      'save',
      EmailNotificationListener('admin@example.com'),
    );

  try {
    editor.openFile('test.txt');
    editor.saveFile();
  } catch (e) {
    print(e);
  }
}
```

**Output:**
```
Save to log "log.txt": Someone has performed "open" operation with the following file: "test.txt"
Email to "admin@example.com": Someone has performed "save" operation with the following file: "test.txt"
```
