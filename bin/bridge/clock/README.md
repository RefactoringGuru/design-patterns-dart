# Bridge pattern
The idea for the bridge pattern example is taken from [here](https://habr.com/ru/post/85137/).

**Diagram:**
![image](https://user-images.githubusercontent.com/8049534/145851578-f6e95355-e2b3-4f94-bda2-c2d1d0de8935.png)

**Client code:**
```dart
void main() {
  final onceMelody = Once(seconds: 1, bell: Melody());
  final onceSignal = Once(seconds: 2, bell: Signal());
  final intervalMelody = Interval(seconds: 5, bell: Melody());
  final intervalSignal = Interval(seconds: 3, bell: Signal());
  startAlarm([
    onceMelody,
    onceSignal,
    intervalMelody,
    intervalSignal,
  ]);
}

void startAlarm(List<Clock> clocks) {
  for (var i = 0; i < clocks.length; i++) {
    clocks[i].start();
  }
}
```

**Output:**

https://user-images.githubusercontent.com/8049534/145850512-27a5e9ea-4f76-4d52-b784-9bc88aee4de8.mp4
