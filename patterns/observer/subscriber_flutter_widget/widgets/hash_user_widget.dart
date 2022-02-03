import 'package:flutter/widgets.dart';

import '../../app_observer/observer/app_observer.dart';
import '../events/new_hash_event.dart';
import '../subscriber/subscriber_widget.dart';

class HashUserWidget extends StatelessWidget {
  final AppObserver observer;

  const HashUserWidget({Key? key, required this.observer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubscriberWidget<NewHashEvent>(
      observer: observer,
      builder: (context, event) {
        return Text(
          event?.newHash ?? 'Hash no generated',
        );
      },
    );
  }
}
