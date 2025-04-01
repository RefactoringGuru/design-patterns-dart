import 'dart:io';

import '../listeners/event_listener.dart';

class EventManager {
  final _listeners = <String, List<EventListener>>{};

  EventManager(List<String> operations) {
    for (final operation in operations) {
      _listeners[operation] = [];
    }
  }

  void subscribe(String eventType, EventListener listener) {
    _usersBy(eventType).add(listener);
  }

  void unsubscribe(String eventType, EventListener listener) {
    _usersBy(eventType).remove(listener);
  }

  void notify(String eventType, File file) {
    final users = _usersBy(eventType);
    for (final listener in users) {
      listener.update(eventType, file);
    }
  }

  List<EventListener> _usersBy(String eventType) {
    final users = _listeners[eventType];

    if (users == null) {
      throw UnsupportedError('Event type "$eventType" do not support.');
    }

    return users;
  }
}
