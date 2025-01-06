# Proxy Pattern
Proxy is a structural design pattern that lets you provide a substitute or placeholder for another 
object. A proxy controls access to the original object, allowing you to perform something either 
before or after the request gets through to the original object.

Tutorial: [here](https://refactoring.guru/design-patterns/proxy).

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/175926828-d4fed7c6-ea82-4717-a24b-8ad2b23910ba.png)

### Client code:
```dart
void main() async {
  final subject = Proxy();
  print(subject.request()); // print "Proxy data"

  print('Wait for 2 seconds...');
  await Future.delayed(Duration(seconds: 2));

  print(subject.request()); // print "Real data"
}
```

### Output:
```
Proxy data.
Wait 2 seconds...
Real data.
```
