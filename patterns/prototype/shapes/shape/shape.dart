import 'cloneable.dart';

abstract class Shape implements Cloneable<Shape> {
  final int x;
  final int y;

  Shape({
    required this.x,
    required this.y,
  });


  @override
  String toString() => '$runtimeType(address: 0x${hashCode.toRadixString(16)})';
}
