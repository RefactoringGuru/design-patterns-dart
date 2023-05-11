import 'package:flutter/widgets.dart';

import '../../../pattern/property.dart';

abstract class PropertyWidgetFactory<T> {
  Widget createWidget(Property<T> property);

  bool isPropertyCompatible(Property<T> value);
}
