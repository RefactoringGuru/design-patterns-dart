import 'package:flutter/material.dart';

import '../application.dart';
import 'panels/shape_properties_widget.dart';
import 'panels/snapshot_widget.dart';

class RightPanelWidget extends StatelessWidget {
  final MementoEditorApplication app;

  RightPanelWidget({Key? key, required this.app}) : super(key: key);

  final colors = [
    Color(0xFF000000),
    Color(0xFFD81B60),
    Color(0xFF5E35B1),
    Color(0xFF1E88E5),
    Color(0xFF43A047),
    Color(0xFFFFFFFF),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ShapePropertiesWidget(app: app, colors: colors),
          SnapshotWidget(app: app),
        ],
      ),
    );
  }
}
