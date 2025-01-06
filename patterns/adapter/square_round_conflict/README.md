# Adapter pattern
Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate.

## Square and Round conflict example. 
**Description:** https://refactoring.guru/design-patterns/adapter?#pseudocode

### Class Diagram:
![example](https://user-images.githubusercontent.com/8049534/147594536-66627fa1-f4eb-42ba-b648-8757f9e5bf20.png)

### Client code:
```dart
void main() {
  final hole = RoundHole(5);
  final peg = RoundPeg(5);
  if (hole.fits(peg)) {
    print("Round peg r5 fits round hole r5.");
  }

  final smallSqPeg = SquarePeg(2);
  final largeSqPeg = SquarePeg(20);

  final smallSqPegAdapter = SquarePegAdapter(smallSqPeg);
  final largeSqPegAdapter = SquarePegAdapter(largeSqPeg);

  if (hole.fits(smallSqPegAdapter)) {
    print("Square peg w2 fits round hole r5.");
  }
  if (!hole.fits(largeSqPegAdapter)) {
    print("Square peg w20 does not fit into round hole r5.");
  }
}
```

**Output:**
```
Round peg r5 fits round hole r5.
Square peg w2 fits round hole r5.
Square peg w20 does not fit into round hole r5.
```
