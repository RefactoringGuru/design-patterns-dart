import 'package:flutter/material.dart';

import '../application.dart';
import 'panels/shape_properties_widget.dart';
import 'panels/memento_widget.dart';

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
    return Container(
      padding: EdgeInsets.all(20),
      width: 300,
      child: Column(
        children: [
          ShapePropertiesWidget(app: app, colors: colors),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 2,
            color: Colors.black.withOpacity(.2),
          ),
          Expanded(
            child: MementoWidget(app: app),
          ),
        ],
      ),
    );
  }
}
