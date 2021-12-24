import '../diagram/diagram.dart';
import 'product.dart';

class Box implements Product {
  final List<Product> children;

  Box({required this.children});

  @override
  String get content => 'Box($size)';

  @override
  Diagram toDiagram() {
    return Diagram.parentNode(
      this,
      children,
    );
  }

  @override
  int get size => children.fold(0, (sum, product) => sum + product.size);

  factory Box.single(Product productLeaf) {
    return Box(
      children: [productLeaf],
    );
  }
}
