import 'dart:math';

import 'render_element.dart';

abstract class RenderLayout extends RenderElement {
  final List<RenderElement> children;
  final int space;

  RenderLayout({
    required this.children,
    this.space = 3,
  });

  int get childWidth => children.fold<int>(
      0, (width, renderElement) => width + renderElement.width);

  int get childHeight => children.fold<int>(
      0, (height, renderElement) => height + renderElement.height);

  int get spacesSum => max(0, (children.length - 1) * space);
}
