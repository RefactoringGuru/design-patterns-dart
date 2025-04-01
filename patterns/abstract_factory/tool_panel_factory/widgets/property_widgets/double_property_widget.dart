import 'package:flutter/material.dart';

import '../../pattern/property.dart';
import 'factories/property_widget_factory.dart';
import 'primitive/filed_label.dart';

class DoublePropertyWidgetFactory implements PropertyWidgetFactory {
  @override
  Widget createWidget(Property property) {
    return DoublePropertyWidget(property: property);
  }

  @override
  bool isPropertyCompatible(Property property) => property.value() is double;
}

class DoublePropertyWidget extends StatefulWidget {
  final Property property;

  const DoublePropertyWidget({Key? key, required this.property})
      : super(key: key);

  @override
  _DoublePropertyWidgetState createState() => _DoublePropertyWidgetState();
}

class _DoublePropertyWidgetState extends State<DoublePropertyWidget> {
  @override
  Widget build(BuildContext context) {
    return FieldLabel(
      text: widget.property.name,
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Slider.adaptive(
              min: 0.0,
              max: 300,
              value: widget.property.value() as double,
              onChanged: (val) {
                setState(() {
                  widget.property.onChange(val);
                });
              },
            ),
          ),
          SizedBox(
            width: 32,
            child: Text(
              (widget.property.value() as double).toStringAsFixed(0),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
