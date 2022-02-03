import 'package:flutter/material.dart';
import '../app_observer/observer/app_observer.dart';
import 'widgets/hash_generator_widget.dart';
import 'widgets/hash_user_widget.dart';

class SubscriberFlutterApp extends StatefulWidget {
  @override
  State<SubscriberFlutterApp> createState() => _SubscriberFlutterAppState();
}

class _SubscriberFlutterAppState extends State<SubscriberFlutterApp> {
  final observer = AppObserver();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HashUserWidget(observer: observer),
            HashGeneratorWidget(observer: observer),
          ],
        ),
      ),
    );
  }
}
