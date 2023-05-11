import 'package:flutter/material.dart';

import 'adapter/classic_app_adapter_widget.dart' as adapter;
import 'client_app/app.dart';
import 'client_app/widgets/text_property_widget.dart';

class FlutterAdapterApp extends StatefulWidget {
  @override
  State<FlutterAdapterApp> createState() => _FlutterAdapterAppState();
}

class _FlutterAdapterAppState extends State<FlutterAdapterApp> {
  final app = App();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextPropertyWidget(
            classicApp: app,
          ),
          Expanded(
            child: adapter.ClassicAppAdapterWidget(
              classicApp: app,
            ),
          ),
        ],
      ),
    );
  }
}
