import 'package:design_patterns_dart/text_canvas.dart';

import '../products/product.dart';
import '../products/product_leaf.dart';
import 'render_text.dart';
import 'render_column.dart';
import 'render_element.dart';
import 'render_row.dart';

class Diagram extends RenderElement {
  final RenderElement _rootRenderElement;

  Diagram(RenderElement root)
      : _rootRenderElement = (root is Diagram) ? root._rootRenderElement : root;

  @override
  int get width => _rootRenderElement.width;

  @override
  int get height => _rootRenderElement.height;

  @override
  void render(Canvas dc) => _rootRenderElement.render(dc);

  String renderToText() {
    final dc = Canvas(
      (_rootRenderElement.width / 3).ceil(),
      _rootRenderElement.height,
      fillColor: Color.white,
    );
    render(dc);
    return dc.toString();
  }

  factory Diagram.node(Product product) {
    return Diagram(
      product.toRenderElement(),
    );
  }

  factory Diagram.parentNode(Product product, List<Product> children) {
    return Diagram(
      RenderConnectingLines(
        parent: product.toRenderElement(),
        children: [
          for (final child in children) child.toDiagram()._rootRenderElement,
        ],
      ),
    );
  }
}

extension ExtConvertProductToRenderElement on Product {
  RenderElement toRenderElement() {
    return RenderText(
      content,
      borderStyle: borderStyleBySize(),
    );
  }

  BorderStyle borderStyleBySize() {
    if (size > 4) {
      return BorderStyle.bold;
    } else if (size >= 2) {
      return BorderStyle.double;
    } else if (this is ProductLeaf) {
      return BorderStyle.empty;
    } else {
      return BorderStyle.single; // todo:
    }
  }
}
