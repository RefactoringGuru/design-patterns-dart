import 'dart:io';

abstract class EventListener {
  void update(String eventType, File file);
}
