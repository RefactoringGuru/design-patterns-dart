# Adapter pattern
This example rewrite from [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/master/src/refactoring_guru/bridge/example)
But removed the ability to use null for devices. Instead, the EmptyDevice class is used.

**Description:**
https://refactoring.guru/design-patterns/adapter?#pseudocode

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
