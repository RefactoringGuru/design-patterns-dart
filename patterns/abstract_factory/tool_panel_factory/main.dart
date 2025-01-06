import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/shapes.dart';
import 'app/tools.dart';
import 'factories/circle_factory.dart';
import 'factories/line_factory.dart';
import 'factories/star_factory.dart';
import 'factories/triangle_factory.dart';
import 'factories/text_factory.dart';
import 'widgets/drawing_board.dart';
import 'widgets/property_bar.dart';
import 'widgets/property_widgets/bool_property_widget.dart';
import 'widgets/property_widgets/double_property_widget.dart';
import 'widgets/property_widgets/factories/property_widget_factories.dart';
import 'widgets/property_widgets/string_property_widget.dart';
import 'widgets/tool_panel.dart';

class ToolPanelFactoryApp extends StatefulWidget {
  const ToolPanelFactoryApp({Key? key}) : super(key: key);

  @override
  _ToolPanelFactoryAppState createState() => _ToolPanelFactoryAppState();
}

class _ToolPanelFactoryAppState extends State<ToolPanelFactoryApp> {
  final app = App(
    shapes: Shapes([]),
    tools: Tools(
      factories: [
        LineFactory(),
        CircleFactory(),
        TriangleFactory(),
        StarFactory(),
        TextFactory(),
      ],
      colors: [
        Colors.white,
        Colors.green,
        Colors.blue,
        Colors.yellow,
      ],
    ),
  );

  final propertyWidgetFactories = PropertyWidgetFactories(
    factories: [
      StringPropertyWidgetFactory(),
      DoublePropertyWidgetFactory(),
      BoolPropertyWidgetFactory(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawingBoard(
          shapes: app.shapes,
          onClick: app.addShape,
        ),
        ToolPanel(
          tools: app.tools,
        ),
        PropertyPanel(
          tools: app.tools,
          factories: propertyWidgetFactories,
        ),
      ],
    );
  }
}
