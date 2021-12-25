import 'package:design_patterns_dart/text_canvas.dart';

import '../products/product.dart';
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
    final dc = Canvas(_rootRenderElement.width, 10);
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
      RenderColumn(
        children: [
          // Root node
          product.toRenderElement(),

          // Children nodes
          RenderRow(
            children: [
              for (final child in children) child.toDiagram(),
            ],
          ),
        ],
      ),
    );
  }
}

extension ExtConvertProductToRenderElement on Product {
  RenderElement toRenderElement() {
    return RenderText(
      content,
      borderStyle: borderStyleBySize(size),
    );
  }

  static BorderStyle borderStyleBySize(int size) {
    if (size > 4) {
      return BorderStyle.bold;
    } else if (size >= 2) {
      return BorderStyle.double;
    } else if (size == 1) {
      return BorderStyle.single;
    } else {
      return BorderStyle.single; // todo:
    }
  }
}
