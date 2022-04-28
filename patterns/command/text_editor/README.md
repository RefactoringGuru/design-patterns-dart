# Command pattern
Command is a behavioral design pattern that turns a request into a stand-alone object that contains 
all information about the request.

## Text Editor example 
![image](https://user-images.githubusercontent.com/8049534/149916565-626f74bb-f922-4b10-acaa-87666cdbacb5.png)

In this example, the Command pattern helps to track the history of executed operations and makes it
possible to revert an operation if needed.

More detailed explanation on [RefactoringGuru](https://refactoring.guru/design-patterns/command?#pseudocode).

## Origin source code:
This example rewrite from [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/main/src/refactoring_guru/command/example).
But slightly changed, see the class diagram.

## Diagram:
![image](https://user-images.githubusercontent.com/8049534/149918792-fccae912-2e67-4068-88d1-5cf824f0df2c.png)

### Client code:
```dart
void main() {
  final app = Application();
  app.addListenerExecuteCommand(log);
  app
    ..keyboardInput('Hello world')
    ..moveCursor(position: 6)
    ..keyboardInput('Refactring GuBu ')
    ..selectText(start: 17, end: 19)
    ..ctrlX()
    ..selectText(start: 17, end: 19)
    ..keyboardInput('Guru')
    ..selectText(start: 4, end: 5)
    ..ctrlC()
    ..moveCursor(position: 12)
    ..ctrlV()
    ..moveCursor(position: 28);

  print('\nUndo steps\n');

  while (app.isHistoryNotEmpty) {
    app.ctrlZ();
  }
}
```

**Output:**
```
[➕] Input( cursorPosition: 0, addText: "Hello world" )__________________"Hello world|"
[➕] Move( from: 11, to: 6 )_____________________________________________"Hello |world"
[➕] Input( cursorPosition: 6, addText: "Refactring GuBu " )_____________"Hello Refactring GuBu |world"
[➕] Select( start: 17, end: 19 )________________________________________"Hello Refactring [Gu]Bu world"
[➕] Cut( cursorPosition: 17, cutText: "Gu" )____________________________"Hello Refactring |Bu world"
[➕] Select( start: 17, end: 19 )________________________________________"Hello Refactring [Bu] world"
[➕] Input( cursorPosition: 17, addText: "Guru" )________________________"Hello Refactring Guru| world"
[➕] Select( start: 4, end: 5 )__________________________________________"Hell[o] Refactring Guru world"
[➕] Copy( text: "o" )___________________________________________________"Hell[o] Refactring Guru world"
[➕] Move( from: 5, to: 12 )_____________________________________________"Hello Refact|ring Guru world"
[➕] Past( cursorPosition: 13, text: "o", pevRestore: "" )_______________"Hello Refacto|ring Guru world"
[➕] Move( from: 13, to: 28 )____________________________________________"Hello Refactoring Guru world|"

Undo steps

Undo_Past( cursorPosition: 13, text: "o", pevRestore: "" )______________"Hello Refact|ring Guru world"
Undo_Input( cursorPosition: 17, addText: "Guru" )_______________________"Hello Refactring Bu| world"
Undo_Cut( cursorPosition: 17, cutText: "Gu" )___________________________"Hello Refactring Gu|Bu world"
Undo_Input( cursorPosition: 6, addText: "Refactring GuBu " )____________"Hello |world"
Undo_Input( cursorPosition: 0, addText: "Hello world" )_________________"|"
```
