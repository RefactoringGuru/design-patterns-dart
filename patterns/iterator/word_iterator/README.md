# Iterator pattern
Iterator is a behavioral design pattern that lets you traverse elements of a collection without
exposing its underlying representation (list, stack, tree, etc.).

Tutorial: [here](https://refactoring.guru/design-patterns/iterator).

### Client code:
```dart
void main() {
  final text = Text(
    'Iterator is a behavioral design pattern that lets you traverse elements '
        'of a collection without exposing its underlying representation '
        '(list, stack, tree, etc.).',
  );

  for (final s in text) {
    print(s);
  }
}
```

**Output:**
```
Iterator
is
a
behavioral
design
pattern
that
lets
you
traverse
elements
of
a
collection
without
exposing
its
underlying
representation
list
stack
tree
etc
```
