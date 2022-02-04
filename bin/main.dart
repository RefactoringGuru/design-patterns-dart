import 'package:flutter/material.dart';
import '../patterns/observer/subscriber_flutter_widget/main.dart';
import '../patterns/adapter/flutter_adapter/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refactoring Guru: Flutter launcher',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/adapter/flutter_adapter',
      routes: {
        '/observer/subscriber_flutter_widget': (_) => SubscriberFlutterApp(),
        '/adapter/flutter_adapter': (_) => FlutterAdapterApp(),
      },
    );
  }
}
