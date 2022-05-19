import 'package:flutter/widgets.dart';

import '../../../pattern/property.dart';

import 'property_widget_factory.dart';

class PropertyWidgetFactories {
  final List<PropertyWidgetFactory> _factories;

  PropertyWidgetFactories({
    required List<PropertyWidgetFactory> factories,
  }) : _factories = factories;

  Widget createPropertyWidgetFrom(Property property) {
    for (final factory in _factories) {
      if (factory.isPropertyContain(property)) {
        return factory.createPropertyWidget(property);
      }
    }

    throw 'Value(${property.value()}) property is not support.';
  }

  Iterable<Widget> createListPropertyWidgetsFrom(
    Iterable<Property> properties,
  ) sync* {
    for (final property in properties) {
      yield createPropertyWidgetFrom(property);
    }
  }
}
