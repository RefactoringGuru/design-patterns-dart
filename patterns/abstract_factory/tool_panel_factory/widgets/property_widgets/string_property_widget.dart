import 'package:flutter/material.dart';

import '../../pattern/property.dart';
import 'factories/property_widget_factory.dart';
import 'primitive/filed_label.dart';

class StringPropertyWidgetFactory implements PropertyWidgetFactory {
  @override
  Widget createWidget(Property property) {
    return StringPropertyWidget(property: property);
  }

  @override
  bool isPropertyCompatible(Property property) => property.value() is String;
}

class StringPropertyWidget extends StatelessWidget {
  final Property property;

  const StringPropertyWidget({Key? key, required this.property})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FieldLabel(
      text: property.name,
      child: Container(
        color: Colors.white12,
        width: 120,
        height: 32,
        child: TextFormField(
          style: TextStyle(fontSize: 18, color: Colors.white70),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 5.0, bottom: 14.0),
            border: UnderlineInputBorder(),
          ),
          initialValue: property.value(),
          onChanged: property.onChange,
        ),
      ),
    );
  }
}
