import 'shape/circle.dart';
import 'shape/rectangle.dart';
import 'shape/shape.dart';

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

  businessLogic(originalShapes);
}

void businessLogic(List<Shape> originalShapes) {
  final cloningShapes = [
    for (final shape in originalShapes) shape.clone(),
  ];

  print('Origin shapes:  $originalShapes');
  print('Cloning shapes: $cloningShapes');
}
