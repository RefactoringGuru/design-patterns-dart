# Builder Pattern
Builder is a creational design pattern that lets you construct complex objects step by step. The
pattern allows you to produce different types and representations of an object using the same
construction code.

## Diagram:

![image](https://user-images.githubusercontent.com/8049534/182850365-52969fc7-d743-430b-acc7-da400eae26aa.png)

## Client code:

```dart
void main() {
  final director = Director();

  final product1 = director.construct(ConcreteBuilder1());
  print(product1);

  final product2 = director.construct(ConcreteBuilder2());
  print(product2);
}
```

### Output:

```
ConcreteBuilder1
001: one
002: two
003: three

ConcreteBuilder2
1️⃣: first
2️⃣: second
3️⃣: third
```
