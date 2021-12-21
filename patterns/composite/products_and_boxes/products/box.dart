import 'package:design_patterns_dart/text_canvas.dart';

import '../node/node.dart';
import 'product.dart';

class Box implements Product {
  final List<Product> children;

  Box({required this.children});

  factory Box.single(Product productLeaf) {
    return Box(children: [productLeaf]);
  }

  @override
  Node toNode() {
    return Node(
      text: 'Box($size)',
      borderStyle: _borderStyleBySize,
      children: [
        for (final Product childNode in children) childNode.toNode(),
      ],
    );
  }

  BorderStyle get _borderStyleBySize {
    final currSize = size;
    if (currSize > 4) {
      return BorderStyle.bold;
    } else if (currSize >= 2) {
      return BorderStyle.double;
    } else if (currSize == 1) {
      return BorderStyle.single;
    } else {
      return BorderStyle.single; // todo:
    }
  }

  @override
  int get size => children.fold(0, (sum, product) => sum + product.size);
}
