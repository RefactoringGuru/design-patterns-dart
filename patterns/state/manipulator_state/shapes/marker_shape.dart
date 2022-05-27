import 'package:flutter/material.dart';

import 'base_shape.dart';

class MarkerShape extends BaseShape {
  MarkerShape([super.x = 0, super.y = 0, super.width = 5, super.height = -1]);

  @override
  Rect get rect => Rect.fromLTWH(x - width, y - width, width * 2, width * 2);

  @override
  void paint(Canvas canvas) {}
}
