import 'dart:math';

import 'package:flutter/material.dart';

import '../../app_observer/observer/app_observer.dart';
import '../events/new_hash_event.dart';

class HashGeneratorWidget extends StatelessWidget {
  final AppObserver observer;

  const HashGeneratorWidget({
    Key? key,
    required this.observer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Generate new hash'),
      onPressed: onHashGenerate,
    );
  }

  void onHashGenerate() {
    final hash = Random().nextDouble().hashCode.toString();
    observer.notify(NewHashEvent(hash));
  }
}
