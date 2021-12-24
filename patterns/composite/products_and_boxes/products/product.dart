import '../diagram/diagram.dart';

abstract class Product {
  String get content;

  int get size;

  Diagram toDiagram();
}
