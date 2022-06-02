import '../diagram/diagram.dart';
import 'product.dart';

class Box implements Product {
  Box({required this.children});

  final List<Product> children;

  @override
  String get content {
    final places = size > 1 ? "places: $size, " : "";
    final localPrice = size > 1 ? "price: $price\$" : "$price\$";
    return 'Box($places$localPrice)';
  }

  @override
  Diagram toDiagram() {
    return Diagram.parentNode(
      this,
      children,
    );
  }

  @override
  int get price => children.fold(0, (sum, product) => sum + product.price);

  @override
  int get size => children.fold(0, (sum, product) => sum + product.size);

  factory Box.single(Product productLeaf) {
    return Box(
      children: [productLeaf],
    );
  }
}
