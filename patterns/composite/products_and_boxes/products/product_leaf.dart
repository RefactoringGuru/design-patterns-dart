import 'package:design_patterns_dart/text_canvas.dart';

import '../node/node.dart';
import 'product.dart';

class ProductLeaf implements Product {
  final String content;

  ProductLeaf(this.content);

  @override
  Node toNode() {
    return Node(
      text: content,
      borderStyle: BorderStyle.round,
    );
  }

  @override
  int get size => 1;
}
