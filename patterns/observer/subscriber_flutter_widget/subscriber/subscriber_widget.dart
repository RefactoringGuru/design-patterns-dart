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

  @override
  void initState() {
    widget.observer.subscribe<T>(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.observer.unsubscribe(update);
    super.dispose();
  }

  void update(T event) {
    setState(() => _event = event);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _event);
  }
}
