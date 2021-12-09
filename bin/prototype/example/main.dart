import 'shape/circle.dart';
import 'shape/rectangle.dart';

void main() {
  final originalShapes = [
    Rectangle(
      x: 100,
      y: 100,
      width: 500,
      height: 100,
      color: '0xfff',
    ),
    Circle(
      x: 20,
      y: 30,
      radius: 100,
      color: '0xf0f',
    ),
  ];

  final cloningShapes = [
    for (final shape in originalShapes) shape.clone(),
  ];

  print('Origin shapes:  $originalShapes');
  print('Cloning shapes: $cloningShapes');
}
