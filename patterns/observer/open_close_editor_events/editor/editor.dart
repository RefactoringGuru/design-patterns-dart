import 'dart:io';

import '../event_manager/event_manager.dart';

class Editor {
  final events = EventManager(['open', 'save']);

  File? _file;

  void openFile(String filePath) {
    _file = File(filePath);
    events.notify("open", _file!);
  }

  void saveFile() {
    if (_file == null) {
      throw Exception('Please open a file first.');
    }

    events.notify('save', _file!);
  }
}
