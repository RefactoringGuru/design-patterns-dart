import 'package:flutter/material.dart';

import '../../pattern/property.dart';
import 'factories/property_widget_factory.dart';
import 'primitive/filed_label.dart';

class BoolPropertyWidgetFactory implements PropertyWidgetFactory {
  @override
  Widget createWidget(Property property) {
    return BoolPropertyWidget(property: property);
  }

  @override
  bool isPropertyCompatible(Property property) => property.value() is bool;
}

class BoolPropertyWidget extends StatefulWidget {
  final Property property;

  const BoolPropertyWidget({Key? key, required this.property})
      : super(key: key);

  @override
  _BoolPropertyWidgetState createState() => _BoolPropertyWidgetState();
}

class _BoolPropertyWidgetState extends State<BoolPropertyWidget> {
  @override
  Widget build(BuildContext context) {
    return FieldLabel(
      text: widget.property.name,
      child: Row(
        children: [
          Checkbox(
            value: widget.property.value() as bool,
            onChanged: (val) {
              setState(() {
                widget.property.onChange(val);
              });
            },
          )
        ],
      ),
    );
  }
}
