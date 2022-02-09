import 'dart:math';

import 'package:flutter/material.dart';
import '../app_observer/observer/app_observer.dart';
import 'events/new_hash_event.dart';
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
            HashGeneratorWidget(onHashGenerate: onHashGenerate),
          ],
        ),
      ),
    );
  }

  void onHashGenerate() {
    final hash = Random().nextDouble().hashCode.toString();
    observer.notify(NewHashEvent(hash));
  }
}
