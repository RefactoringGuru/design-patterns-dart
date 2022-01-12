import 'dart:io';

import 'bell.dart';

class Signal extends Bell {
  @override
  void notify(String message) => stdout.write('\x1b[34m$message\x1B[0m');

  @override
  void ring() => stdout.write('\x1b[34m🔉\x1B[0m');
}
