import 'dart:io';

import 'event_listener.dart';

class LogOpenListener implements EventListener {
  File logFile;

  LogOpenListener(String logFileName) : logFile = File(logFileName);

  @override
  void update(String eventType, File file) {
    print('Save to log "${logFile.path}": '
        'Someone has performed "$eventType" '
        'operation with the following file: "${file.path}"');
  }
}
