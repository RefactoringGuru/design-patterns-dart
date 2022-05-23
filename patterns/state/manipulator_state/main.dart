import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'app/app.dart';
import 'app/shapes.dart';
import 'app/tool.dart';
import 'pattern/manipulator_context.dart';
import 'states/creations/circle_creation_state.dart';
import 'states/creations/rectangle_creation_state.dart';
import 'states/creations/text_creation_state.dart';
import 'states/free_sate.dart';
import 'widgets/drawing_board.dart';
import 'widgets/tool_bar.dart';

class ManipulatorStateApp extends StatefulWidget {
  const ManipulatorStateApp({Key? key}) : super(key: key);

  @override
  State createState() => _ManipulatorStateAppState();
}

class _ManipulatorStateAppState extends State<ManipulatorStateApp> {
  final app = App(
    shapes: Shapes(),
    manipulator: ManipulatorContext(
      initState: FreeState(),
    ),
    tools: [
      Tool(
        icon: Icon(MdiIcons.cursorDefaultOutline),
        state: FreeState(),
      ),
      Tool(
        icon: Icon(MdiIcons.rectangleOutline),
        state: RectangleCreationState(),
      ),
      Tool(
        icon: Icon(MdiIcons.circleOutline),
        state: CircleCreationState(),
      ),
      Tool(
        icon: Icon(MdiIcons.formatTextVariant),
        state: TextCreationState(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            DrawingBoard(app: app),
            ToolBar(app: app),
          ],
        ),
      ),
    );
  }
}
