import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/shapes.dart';
import 'app/tool.dart';
import 'pattern/manipulator_context.dart';
import 'states/create_circle_state.dart';
import 'states/create_rectangle_state.dart';
import 'states/create_text_state.dart';
import 'states/free_sate.dart';
import 'widgets/drawing_board.dart';
import 'widgets/tool_bar.dart';

class ManipulatorStateApp extends StatefulWidget {
  const ManipulatorStateApp({Key? key}) : super(key: key);

  @override
  _ManipulatorStateAppState createState() => _ManipulatorStateAppState();
}

class _ManipulatorStateAppState extends State<ManipulatorStateApp> {
  final app = App(
    shapes: Shapes(),
    manipulator: ManipulatorContext(
      initState: FreeState(),
    ),
    tools: [
      Tool(
        icon: Icon(Icons.agriculture_sharp),
        state: FreeState(),
      ),
      Tool(
        icon: Icon(Icons.loupe),
        state: CreateRectangleState(),
      ),
      Tool(
        icon: Icon(Icons.checklist_outlined),
        state: CreateCircleState(),
      ),
      Tool(
        icon: Icon(Icons.fiber_dvr),
        state: CreateTextState(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawingBoard(app: app),
        ToolBar(),
      ],
    );
  }
}
