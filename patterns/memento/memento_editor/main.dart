import 'package:flutter/material.dart';

import '../../adapter/flutter_adapter/adapter/classic_app_adapter_widget.dart'
    as adapter;
import 'application.dart';
import 'widgets/right_panel_widget.dart';


class FlutterMementoEditorApp extends StatefulWidget {
  @override
  State<FlutterMementoEditorApp> createState() =>
      _FlutterMementoEditorAppState();
}

class _FlutterMementoEditorAppState extends State<FlutterMementoEditorApp> {
  final app = MementoEditorApplication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: adapter.ClassicAppAdapterWidget(
              classicApp: app.editor,
            ),
          ),
          RightPanelWidget(app: app),
        ],
      ),
    );
  }
}
