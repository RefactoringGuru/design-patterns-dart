# Facade pattern
Facade is a structural design pattern that provides a simplified interface to a library, a 
framework, or any other complex set of classes.

Tutorial: [here](https://refactoring.guru/design-patterns/facade).

### About example.
This the very conceptual example rewrite from original source code [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/main/src/refactoring_guru/facade/example)

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/183629745-a62d81be-f640-48e8-b70c-00d6cf59aa5f.png)

### Client code:
```dart
void main() {
  final converter = VideoConversionFacade();
  final mp4Video = converter.convertVideo("youtubevideo.ogg", "mp4");
  // ...;
}
```

### Output:
```
VideoConversionFacade: conversion started.
CodecFactory: extracting ogg audio...
BitrateReader: reading file...
BitrateReader: writing file...
AudioMixer: fixing audio...
VideoConversionFacade: conversion completed.
```
