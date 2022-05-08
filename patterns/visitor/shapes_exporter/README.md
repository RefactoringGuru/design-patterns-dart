# Visitor pattern
Visitor is a behavioral design pattern that lets you separate algorithms from the objects on which 
they operate.

Tutorial: [here](https://refactoring.guru/design-patterns/visitor).

### About example: Shape XML Exporter.
In this example, the Visitor pattern adds XML export support to the class hierarchy of geometric 
shapes [More info](https://refactoring.guru/design-patterns/visitor#pseudocode).

This example rewrite from original source code [java example](https://github.com/RefactoringGuru/design-patterns-java/tree/main/src/refactoring_guru/visitor/example)

### Diagram:
![image](https://user-images.githubusercontent.com/8049534/167304227-04237030-879e-4d7f-be32-4c815a3e1cbf.png)

### Client code:
```dart
  final compoundShape = CompoundShape(
    x: 30,
    y: 45,
    children: [
      Rectangle(x: 10, y: 10, width: 100, height: 100),
      Circle(xCenter: 300, yCenter: 20, radius: 35),
      Dot(x: 60, y: 60),
      CompoundShape(
        x: 5,
        y: 5,
        children: [
          Dot(x: 15, y: 15),
          Dot(x: 20, y: 20),
        ],
      ),
    ],
  );

  final xml = XMLExportVisitor().export(compoundShape);
  print(xml);
```

### Output:
```xml
<?xml version="1.0" encoding="utf-8"?>
<compound>
  <x>30</x>
  <y>45</y>
  <children>
    <rectangle>
      <x>10</x>
      <y>10</y>
      <width>100</width>
      <height>100</height>
    </rectangle>
    <circle>
      <xCenter>300</xCenter>
      <yCenter>20</yCenter>
      <radius>35</radius>
    </circle>
    <dot>
      <x>60</x>
      <y>60</y>
    </dot>
    <compound>
      <x>5</x>
      <y>5</y>
      <children>
        <dot>
          <x>15</x>
          <y>15</y>
        </dot>
        <dot>
          <x>20</x>
          <y>20</y>
        </dot>
      </children>
    </compound>
  </children>
</compound>
```
