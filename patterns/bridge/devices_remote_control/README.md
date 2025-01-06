# Bridge pattern
This example rewrite from [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/main/src/refactoring_guru/bridge/example)
But removed the ability to use null for devices. Instead, the EmptyDevice class is used.

### Remote device example

Example describe this: https://refactoring.guru/design-patterns/bridge?#pseudocode

### Diagram:

![image](https://user-images.githubusercontent.com/8049534/145878324-3cbc52f5-51f4-4642-921d-69fbe2886f8c.png)

### Client code:
```dart
void main() {
  testDevice(Tv());
  testDevice(Radio());
  testDevice(EmptyDevice());
}

void testDevice(Device device) {
  print(''.padRight(36, '='));
  print(device.runtimeType);
  print("Tests with basic remote.");
  final basicRemote = BasicRemote.fromDevice(device);
  basicRemote.power();
  device.printStatus();

  print("Tests with advanced remote.");
  final advancedRemote = AdvancedRemote.fromDevice(device);
  advancedRemote.power();
  advancedRemote.mute();
  device.printStatus();
}
```

**Output:**

```
====================================
Tv
Tests with basic remote.
Remote: power toggle
------------------------------------
| I'm TV set.
| I'm enabled
| Current volume is 30%
| Current channel is 1
------------------------------------

Tests with advanced remote.
Remote: power toggle
Remote: mute
------------------------------------
| I'm TV set.
| I'm disabled
| Current volume is 30%
| Current channel is 1
------------------------------------

====================================
Radio
Tests with basic remote.
Remote: power toggle
------------------------------------
| I'm radio.
| I'm enabled
| Current volume is 30%
| Current channel is 1
------------------------------------

Tests with advanced remote.
Remote: power toggle
Remote: mute
------------------------------------
| I'm radio.
| I'm disabled
| Current volume is 30%
| Current channel is 1
------------------------------------

====================================
EmptyDevice
Tests with basic remote.
Remote: power(device not found)
------------------------------------
| Device is Empty
------------------------------------

Tests with advanced remote.
Remote: power(device not found)
Remote: mute(device not found)
------------------------------------
| Device is Empty
------------------------------------
```
