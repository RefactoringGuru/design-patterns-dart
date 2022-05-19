import 'package:flutter/material.dart';

import '../app/tools.dart';
import '../pattern/property.dart';
import '../pattern/tool_factory.dart';
import 'independent/panel.dart';

class PropertyPanel extends StatelessWidget {
  final Tools tools;

  const PropertyPanel({
    Key? key,
    required this.tools,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: 12 + 64 + 8 + 12,
      child: _buildTheme(
        child: Panel(
          direction: Axis.horizontal,
          child: ValueListenableBuilder<ToolFactory>(
            valueListenable: tools.activeFactory,
            builder: (_, activeFactory, __) {
              return Row(
                children: [
                  for (final prop in activeFactory.properties)
                    _buildProperty(prop),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTheme({required Widget child}) {
    return Material(
      color: Colors.transparent,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Arial',
      ),
      child: Theme(
          data: ThemeData(
            primarySwatch: Colors.pink,
            unselectedWidgetColor: Colors.grey, // Your color
          ),
          child: child),
    );
  }

  Widget _buildProperty(Property prop) {
    final val = prop.value();

    if (val is String) {
      return StringPropertyWidget(property: prop);
    } else if (val is double) {
      return DoublePropertyWidget(property: prop);
    } else if (val is bool) {
      return BoolPropertyWidget(property: prop);
    }

    throw 'Type(${prop.value().runtimeType}) of property is not support';
  }
}

class StringPropertyWidget extends StatelessWidget {
  final Property property;

  const StringPropertyWidget({Key? key, required this.property})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FieldLabel(
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
    return _FieldLabel(
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
    return _FieldLabel(
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

class _FieldLabel extends StatelessWidget {
  final String text;
  final Widget child;

  const _FieldLabel({
    Key? key,
    required this.text,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Text(text + ':'),
        SizedBox(width: 10),
        child,
        SizedBox(width: 20),
      ],
    );
  }
}
