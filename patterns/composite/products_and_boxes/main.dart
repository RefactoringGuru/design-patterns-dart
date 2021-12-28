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
        ProductLeaf('Molot', 9),
      ),
      Box(
        children: [
          Box(
            children: [
              Box.single(
                ProductLeaf('Phone', 450),
              ),
              Box.single(
                ProductLeaf('Hidrophone', 30),
              ),
            ],
          ),
          Box.single(
            ProductLeaf('Lamp', 25),
          ),
        ],
      ),
      ProductLeaf('Paychak', 0),
    ],
  );
}
