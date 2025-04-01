# Singleton Pattern
Singleton is a creational design pattern that lets you ensure that a class has only one instance, 
while providing a global access point to this instance.

Tutorial: [here](https://refactoring.guru/design-patterns/singleton).

### Diagram:
![Singleton Pattern Diagram](https://user-images.githubusercontent.com/8049534/182938119-78a21534-5751-4dea-afa3-8acaec46eed9.png)

### Client code:
```dart
void main() {
  // dart style
  Singleton().doSome();
  Singleton().doSome();

  // standard style
  Singleton.instance.doSome();
}
```

### Output:
```
Create singleton once.
doSome()
doSome()
doSome()
```
