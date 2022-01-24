# Bridge pattern
Bridge is a structural design pattern that lets you split a large class or a set of closely related 
classes into two separate hierarchies—abstraction and implementation—which can be developed independently of each other.

## Example
The idea for the bridge pattern example is taken from [here](https://habr.com/ru/post/85137/).

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/145851578-f6e95355-e2b3-4f94-bda2-c2d1d0de8935.png)

### Client code:
```dart
void main() {
  final melody = Melody();
  final signal = Signal();
  startClocks([
    Once(seconds: 1, bell: melody),
    Once(seconds: 2, bell: signal),
    Interval(seconds: 5, bell: melody),
    Interval(seconds: 3, bell: signal),
  ]);
}

void startClocks(List<Clock> clocks) {
  for (final clock in clocks) {
    clock.start();
  }
}
```

**Output:**

https://user-images.githubusercontent.com/8049534/145850512-27a5e9ea-4f76-4d52-b784-9bc88aee4de8.mp4
