import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/shapes.dart';
import 'app/tools.dart';
import 'factories/circle_factory.dart';
import 'factories/line_factory.dart';
import 'factories/star_factory.dart';
import 'factories/triangle_factory.dart';
import 'factories/txt_factory.dart';
import 'widgets/drawing_board.dart';
import 'widgets/tool_panel.dart';

class WToolPanelApp extends StatefulWidget {
  const WToolPanelApp({Key? key}) : super(key: key);

  @override
  _WToolPanelAppState createState() => _WToolPanelAppState();
}

class _WToolPanelAppState extends State<WToolPanelApp> {
  final app = App(
    shapes: Shapes([]),
    tools: Tools(
      factories: [
        TxtFactory(),
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
      ],
    );
  }
}
