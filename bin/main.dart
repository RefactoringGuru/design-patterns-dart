import 'package:flutter/material.dart';
import '../patterns/observer/subscriber_flutter_widget/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refactoring Guru: Flutter launcher',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/observer/subscriber_flutter_widget',
      routes: {
        '/observer/subscriber_flutter_widget': (_) => SubscriberFlutterApp(),
      },
    );
  }
}
