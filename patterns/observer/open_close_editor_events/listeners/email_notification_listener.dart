import 'dart:io';

import 'event_listener.dart';

class EmailNotificationListener implements EventListener {
  String email;

  EmailNotificationListener(this.email);

  @override
  void update(String eventType, File file) {
    print('Email to "$email": '
        'Someone has performed "$eventType" '
        'operation with the following file: "${file.path}"');
  }
}
