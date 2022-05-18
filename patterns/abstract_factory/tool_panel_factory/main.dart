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
        TextFactory(),
        LineFactory(),
        CircleFactory(),
        TriangleFactory(),
        StarFactory(),
      ],
      colors: [
        Colors.white,
        Colors.green,
        Colors.blue,
        Colors.yellow,
      ],
    ),
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
        ),
      ],
    );
  }
}
