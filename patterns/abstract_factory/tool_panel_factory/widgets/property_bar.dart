import 'package:flutter/material.dart';

import '../app/tools.dart';
import '../pattern/tool_factory.dart';
import 'independent/panel.dart';
import 'property_widgets/factories/property_widget_factories.dart';
import 'property_widgets/primitive/theme_property.dart';

class PropertyPanel extends StatelessWidget {
  final Tools tools;
  final PropertyWidgetFactories factories;

  const PropertyPanel({
    Key? key,
    required this.tools,
    required this.factories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: 12 + 64 + 8 + 12,
      child: ThemeProperty(
        child: Panel(
          direction: Axis.horizontal,
          child: ValueListenableBuilder<ToolFactory>(
            valueListenable: tools.activeFactory,
            builder: (_, activeToolFactory, __) {
              return Row(
                children: factories
                    .createListWidgetsFrom(activeToolFactory.properties)
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
