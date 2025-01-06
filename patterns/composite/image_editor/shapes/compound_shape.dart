import 'dart:math';

import 'package:design_patterns_dart/text_canvas.dart';
import 'package:design_patterns_dart/text_canvas/primitives.dart';

import '../editor/image_editor.dart';
import 'base_shape.dart';
import 'shape.dart';

class CompoundShape extends BaseShape {
  final _children = <Shape>[];

  CompoundShape([List<Shape> children = const []]) : super(0, 0, Color.black) {
    _children.addAll(children);
  }

  void add(Shape component) => _children.add(component);

  void addAll(List<Shape> children) => _children.addAll(children);

  void remove(Shape child) => _children.remove(child);

  void removeList(List<Shape> children) {
    for (final item in children) {
      _children.remove(item);
    }
  }

  void clear() => _children.clear();

  @override
  int get x {
    if (_children.isEmpty) {
      return 0;
    }

    var minX = _children.fold<int>(
      _children.first.x,
      (x, Shape element) => element.x > x ? x : element.x,
    );

    return minX;
  }

  @override
  int get y {
    if (_children.isEmpty) {
      return 0;
    }

    var minY = _children.fold<int>(
      _children.first.y,
      (y, Shape element) => element.y > y ? y : element.y,
    );

    return minY;
  }

  @override
  int get width {
    int maxWidth = 0;
    final y = this.y;
    for (final child in _children) {
      int childWidth = child.x + child.width - y;
      if (childWidth > maxWidth) {
        maxWidth = childWidth;
      }
    }

    return maxWidth;
  }

  @override
  int get height {
    int maxHeight = 0;
    final y = this.y;
    for (final child in _children) {
      final childHeight = child.y + child.height - y;
      if (childHeight > maxHeight) {
        maxHeight = childHeight;
      }
    }

    return maxHeight;
  }

  @override
  void move(int x, int y) {
    for (Shape child in _children) {
      child.move(x, y);
    }
  }

  @override
  void unSelect() {
    super.unSelect();
    for (Shape child in _children) {
      child.unSelect();
    }
  }

  @override
  void select() {
    super.select();
    for (Shape child in _children) {
      child.select();
    }
  }

  @override
  void paint(Graphics graphics) {
    if (isSelected) {
      const padding = 2;
      graphics
        ..translate = Point(
          x * graphics.lineStretch - graphics.lineStretch,
          y - 2,
        )
        ..border(
          (width + 2 + 1) * graphics.lineStretch,
          height + padding * 2 + 1,
          BorderStyle.single,
        );
    }

    for (Shape child in _children) {
      graphics.translate = Point(0, 0);
      child.paint(graphics);
    }
  }
}
