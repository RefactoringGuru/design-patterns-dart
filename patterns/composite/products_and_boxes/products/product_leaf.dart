import '../diagram/diagram.dart';
import 'product.dart';

class ProductLeaf implements Product {
  @override
  final String content;

  @override
  int get size => 1;

  ProductLeaf(this.content);

  @override
  Diagram toDiagram() {
    return Diagram.node(this);
  }
}
