import 'package:flutter/widgets.dart';

import 'property.dart';
import 'shape.dart';

abstract class ToolFactory {
  Image get icon;

  Shape createShape(double x, double y, Color color);

  Iterable<Property> get properties;
}
