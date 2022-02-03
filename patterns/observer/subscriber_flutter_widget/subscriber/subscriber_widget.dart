import 'package:flutter/widgets.dart';

import '../../app_observer/observer/app_observer.dart';
import '../../app_observer/observer/event.dart';

class SubscriberWidget<T extends Event> extends StatefulWidget {
  final AppObserver observer;
  final Widget Function(BuildContext buildContext, T? event) builder;

  const SubscriberWidget({
    Key? key,
    required this.builder,
    required this.observer,
  }) : super(key: key);

  @override
  State<SubscriberWidget<T>> createState() {
    return _SubscriberWidgetState<T>();
  }
}

class _SubscriberWidgetState<T extends Event>
    extends State<SubscriberWidget<T>> {
  T? _event;
  late EventFunction<T> _saveSubscriber;

  @override
  void initState() {
    _saveSubscriber = widget.observer.subscribe<T>(
      (event) => setState(() => _event = event),
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.observer.unsubscribe(_saveSubscriber);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _event);
  }
}
