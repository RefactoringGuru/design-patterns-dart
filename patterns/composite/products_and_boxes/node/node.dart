import 'package:design_patterns_dart/text_canvas.dart';

import '../diagram/diagram.dart';
import '../diagram/render_element.dart';

class Node {
  final String text;
  final List<Node> children;
  final BorderStyle borderStyle;

  Node({
    required this.text,
    required this.borderStyle,
    this.children = const <Node>[],
  });

  Diagram toDiagram() {
    // get size & position
    final spaceBetweenChildren = 2;
    final childDiagrams = [
      for (final child in children) child.toDiagram(),
    ].toList();
    final childXPosition = [
      for (final child in childDiagrams) child.width + spaceBetweenChildren,
    ];
    final childWidth = childXPosition.fold<int>(0, (a, b) => a + b);
    final thisBox = BorderText(text, borderStyle);
    final thisBoxCenterX = (childWidth + thisBox.width) ~/ 2;

    final resultDiagram = Diagram();
    resultDiagram.addRenderElement(thisBoxCenterX, 0, thisBox);

    final y = thisBox.height;
    var x = 0;

    for (final childDiagram in childDiagrams) {
      resultDiagram.addRenderElement(x, y, childDiagram);
      // resultDiagram.drawLine((childDiagram.width / 2) + x, y, x2, y2);
      x += childDiagram.width;
    }

    return resultDiagram;
  }
}

