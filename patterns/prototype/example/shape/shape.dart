abstract class Shape {
  final int x;
  final int y;

  Shape({
    required this.x,
    required this.y,
  });

  Shape clone();

  @override
  String toString() => '$runtimeType(address: 0x${hashCode.toRadixString(16)})';
}
