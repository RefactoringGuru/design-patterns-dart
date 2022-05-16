import 'package:flutter/material.dart';
import '../patterns/abstract_factory/tool_panel_factory/main.dart';
import '../patterns/observer/subscriber_flutter_widget/main.dart';
import '../patterns/adapter/flutter_adapter/main.dart';
import '../patterns/memento/memento_editor/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refactoring Guru: Flutter launcher',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/abstract_factory/tool_panel',
      routes: {
        '/observer/subscriber_flutter_widget': (_) => SubscriberFlutterApp(),
        '/adapter/flutter_adapter': (_) => FlutterAdapterApp(),
        '/memento/flutter_memento_editor': (_) => FlutterMementoEditorApp(),
        '/abstract_factory/tool_panel_factory': (_) => ToolPanelFactoryApp(),
      },
    );
  }
}
