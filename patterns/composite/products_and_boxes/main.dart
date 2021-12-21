import 'package:design_patterns_dart/text_canvas.dart';

import 'diagram/render_element.dart';
import 'products/box.dart';
import 'products/product.dart';
import 'products/product_leaf.dart';

void main() {
  final dc = Canvas(6, 6);
print(
     BorderText('Node', BorderStyle.single).render(dc)
);
}

Product createParcel() {
  return Box(
    children: [
      Box.single(
        ProductLeaf('🔨'),
      ),
      Box(
        children: [
          Box(
            children: [
              Box.single(
                ProductLeaf('📱'),
              ),
              Box.single(
                ProductLeaf('🎧'),
              ),
            ],
          ),
          Box.single(
            ProductLeaf('🔌'),
          ),
        ],
      ),
      ProductLeaf('🧾'),
    ],
  );
}
