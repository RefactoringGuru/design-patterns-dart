import 'package:flutter/material.dart';

class EventListenableBuilder<T extends ChangeNotifier> extends StatefulWidget {
  final T event;
  final Widget Function(BuildContext context) builder;

  const EventListenableBuilder({
    Key? key,
    required this.event,
    required this.builder,
  }) : super(key: key);

  @override
  _EventListenableBuilderState createState() =>
      _EventListenableBuilderState(event);
}

class _EventListenableBuilderState<T extends ChangeNotifier>
    extends State<EventListenableBuilder<T>> {
  final T event;

  _EventListenableBuilderState(this.event);

  @override
  void initState() {
    event.addListener(_update);
    super.initState();
  }

  @override
  void dispose() {
    event.removeListener(_update);
    super.dispose();
  }

  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
