# Memento pattern
Memento is a behavioral design pattern that lets you save and restore the previous state of an 
object without revealing the details of its implementation.

Tutorial: [here](https://refactoring.guru/design-patterns/memento).

## Conceptual Editor example 
This example uses the Memento pattern alongside the Command pattern for storing snapshots of the 
complex text editor’s state and restoring an earlier state from these snapshots when needed.

More detailed explanation on [RefactoringGuru](https://refactoring.guru/design-patterns/memento?#pseudocode).

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/151352367-c97db094-fc87-4eb2-9210-581914c57ced.png)

### Client code:
```dart
void main() {
  final editor = Editor('New Document');
  final firstState = Command.makeBackup(editor);
  editor.text += ' add text';
  final secondState = Command.makeBackup(editor);

  print('Current state: "${editor.text}"');

  firstState.undo();
  print('First state: "${editor.text}"');

  secondState.undo();
  print('Second state: "${editor.text}"');
}
```

**Output:**
```
Current state: "New Document add text"
First state: "New Document"
Second state: "New Document add text"
```
