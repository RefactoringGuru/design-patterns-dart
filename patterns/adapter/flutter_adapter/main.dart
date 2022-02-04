import 'package:flutter/material.dart';

import 'adapter/classic_app_widget_adapter.dart';
import 'client_app/app.dart';
import 'client_app/text_property_widget.dart';

class FlutterAdapterApp extends StatefulWidget {
  @override
  State<FlutterAdapterApp> createState() => _FlutterAdapterAppState();
}

class _FlutterAdapterAppState extends State<FlutterAdapterApp> {
  final app = App();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextPropertyWidget(
          classicApp: app,
        ),
        Expanded(
          child: ClassicAppWidgetAdapter(
            classicApp: app,
          ),
        ),
      ],
    );
  }
}
