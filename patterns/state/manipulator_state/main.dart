import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'app/app.dart';
import 'app/shapes.dart';
import 'app/tool.dart';
import 'pattern/manipulator.dart';
import 'states/creations/circle_creation_state.dart';
import 'states/creations/rectangle_creation_state.dart';
import 'states/creations/text_creation_state.dart';
import 'states/free_sate.dart';
import 'states/_/paint_style.dart';
import 'widgets/current_state.dart';
import 'widgets/drawing_board.dart';
import 'widgets/tool_bar.dart';

class ManipulatorStateApp extends StatefulWidget {
  const ManipulatorStateApp({Key? key}) : super(key: key);

  @override
  State createState() => _ManipulatorStateAppState();
}

class _ManipulatorStateAppState extends State<ManipulatorStateApp> {
  late final App app;

  @override
  void initState() {
    final shapes = Shapes([]);
    app = App(
      shapes: shapes,
      manipulator: BaseManipulator(
        initState: FreeState(),
        shapes: shapes,
        paintStyle: PaintStyle(Colors.pink),
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            DrawingBoard(app: app),
            ToolBar(app: app),
            CurrentState(manipulator: app.manipulator),
          ],
        ),
      ),
    );
  }
}
