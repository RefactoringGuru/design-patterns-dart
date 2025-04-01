import 'package:design_patterns_dart/text_canvas.dart';

import '../products/product.dart';
import '../render_elements/render_connecting_lines.dart';
import '../render_elements/render_element.dart';
import 'convert_product_to_render_element.dart';

class Diagram {
  Diagram(this.rootRenderElement);

  final RenderElement rootRenderElement;

  String renderToText() {
    const pixelWidth = 3;
    final width = (rootRenderElement.width / pixelWidth).ceil();
    final height = rootRenderElement.height;
    final dc = Canvas(
      width,
      height,
      lineStretch: pixelWidth,
      fillColor: Color.white,
    );
    rootRenderElement.render(dc);

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
          for (final child in children) child.toDiagram().rootRenderElement,
        ],
      ),
    );
  }
}
