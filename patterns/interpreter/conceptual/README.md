# Interpreter Pattern
In computer programming, the interpreter pattern is a design pattern that specifies how to evaluate 
sentences in a language. 

## Diagram:
![Interpreter Diagram](https://user-images.githubusercontent.com/8049534/176169636-4c8eb3ba-d5e8-4ecb-81a8-96f1a30f6339.png)

## Client code:
```dart
void main() {
  final context = Context();
  final variable1 = BoolVariable('var1');
  final variable2 = BoolVariable('var2');
  final variable3 = BoolVariable('var3');
  final variable4 = BoolVariable('var4');

  context.assign(variable1, true);
  context.assign(variable2, false);
  context.assign(variable3, true);
  context.assign(variable4, false);

  final expression = And(
    variable1, // true
    Xor(
      variable2, // false
      Or(
        variable3, // true
        variable4, // false
      ),
    ),
  );

  print(expression.evaluate(context));
  print(expression.toDebugString(context));
}
```

### Output:
```
var4(false) Or var3(true) Xor var2(false) And var1(true)
result: true
```
