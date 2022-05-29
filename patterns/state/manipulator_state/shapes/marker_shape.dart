import 'package:flutter/material.dart';

import 'base_shape.dart';

class MarkerShape extends BaseShape {
  MarkerShape(double size) : super(0, 0, size, -1);

  @override
  Rect get rect => Rect.fromLTWH(x - width, y - width, width * 2, width * 2);
}
