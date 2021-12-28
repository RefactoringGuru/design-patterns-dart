import 'products/box.dart';
import 'products/product.dart';
import 'products/product_leaf.dart';

void main() {
  final diagram = createParcel().toDiagram();
  print(diagram.renderToText());
}

Product createParcel() {
  return Box(
    children: [
      Box.single(
        ProductLeaf('Hammer', 9),
      ),
      Box(
        children: [
          Box(
            children: [
              Box.single(
                ProductLeaf('Phone', 450),
              ),
              Box.single(
                ProductLeaf('Headphones', 30),
              ),
            ],
          ),
          Box.single(
            ProductLeaf('Charger', 25),
          ),
        ],
      ),
      ProductLeaf('Receipt', 0),
    ],
  );
}
