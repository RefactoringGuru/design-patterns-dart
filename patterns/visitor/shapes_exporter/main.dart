import 'shapes/circle.dart';
import 'shapes/compound_shape.dart';
import 'shapes/dot.dart';
import 'shapes/rectangle.dart';
import 'visitor/xml_export_visitor.dart';

void main() {
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
}
