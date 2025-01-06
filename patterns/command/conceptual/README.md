# Command Pattern
Command is a behavioral design pattern that turns a request into a stand-alone object that contains
all information about the request.

Tutorial: [here](https://refactoring.guru/design-patterns/command).

## Diagram:
![image](https://user-images.githubusercontent.com/8049534/183062798-c2e9207d-850c-47b6-bbba-3d669299d69f.png)

## Client dode:
```dart
void main() {
  final mutStr = MutStr();

  final input1 = AddTextCommand('One', mutStr);
  final input2 = AddTextCommand('Three', mutStr);
  final input3 = InsertTextCommand(' Two ', mutStr, pos: 2);

  input1.execute();
  print('text = $mutStr'); // mutStr = "One"

  input2.execute();
  print('text = $mutStr'); // mutStr = "OneThree"

  input3.execute();
  print('text = $mutStr'); // mutStr = "One Two Three"

  input3.undo();
  print('text = $mutStr'); // mutStr = "OneThree"

  input2.undo();
  print('text = $mutStr'); // mutStr = "One "

  input1.undo();
  print('text = $mutStr'); // mutStr = ""
}
```

### Output:
```
text = One
text = OneThree
text = One Two Three
text = OneThree
text = One
text = 
```
