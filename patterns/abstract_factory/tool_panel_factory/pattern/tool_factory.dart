import 'package:flutter/widgets.dart';

import 'shape.dart';

abstract class FactoryTool {
  Shape createShape(double x, double y, Color color);

  Image get icon;
}
