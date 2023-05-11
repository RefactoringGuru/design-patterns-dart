import 'event.dart';

typedef EventFunction<T> = void Function(T e);

class AppObserver {
  final _subscribers = <int, List<dynamic>>{};

  EventFunction<T> subscribe<T>(EventFunction<T> func) {
    assert(
      Class<T>() is Class<Event>,
      '\n\nThe callback argument must implement the "Event" class.\n'
      'Correct use: \n'
      '\tobserver.subscribe((MyEvent e) {}); \n'
      'Mistaken usage: \n'
      '\tobserver.subscribe((String e) {});\n'
      '\tobserver.subscribe((e) {});\n',
    );

    _subscribers.putIfAbsent(T.hashCode, () => []).add(func);
    return func;
  }

  void unsubscribe<T extends Event>(EventFunction<T> func) {
    final isDeleted = _subscribers[T.hashCode]?.remove(func) ?? false;

    if (isDeleted) {
      return;
    }

    throw Exception('Subscriber not found.');
  }

  void notify<T extends Event>(T event) {
    final subscribers = _subscribers[T.hashCode];

    if (subscribers == null) {
      return;
    }

    for (var sub in subscribers) {
      sub.call(event);
    }
  }
}

class Class<T> {}
