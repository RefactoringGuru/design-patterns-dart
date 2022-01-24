import '../diagram/diagram.dart';
import 'product.dart';

class ProductLeaf implements Product {
  ProductLeaf(this.name, this.price);

  @override
  String get content => '$name($price\$)';

  final String name;

  @override
  final int price;

  @override
  int get size => 1;

  @override
  Diagram toDiagram() {
    return Diagram.node(this);
  }
}
