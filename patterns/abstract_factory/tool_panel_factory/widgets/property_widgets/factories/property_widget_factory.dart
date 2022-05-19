import 'package:flutter/widgets.dart';

import '../../../pattern/property.dart';

abstract class PropertyWidgetFactory<T> {
  Widget createPropertyWidget(Property property);

  bool isPropertyContain(Property value);
}
