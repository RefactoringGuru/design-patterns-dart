import '../diagram/diagram.dart';

abstract class Product {
  String get content;

  int get size;

  int get price;

  Diagram toDiagram();
}
