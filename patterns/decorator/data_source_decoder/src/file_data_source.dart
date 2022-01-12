import 'dart:io';

import 'data_source.dart';

class FileDataSource implements DataSource {
  final String _name;

  FileDataSource(String name) : _name = thisPath(name);

  @override
  void writeData(String data) {
    File(_name).writeAsStringSync(data);
  }

  @override
  String readData() {
    return File(_name).readAsStringSync();
  }
}

thisPath(name) =>
    Platform.script.pathSegments
        .sublist(0, Platform.script.pathSegments.length - 1)
        .join(Platform.pathSeparator) +
    Platform.pathSeparator +
    name;
