import 'package:flutter/material.dart';
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
      home: Scaffold(
        body: FlutterAdapterApp(),
      ),
    );
  }
}
