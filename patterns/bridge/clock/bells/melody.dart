import 'dart:io';

import 'bell.dart';

class Melody extends Bell {
  @override
  void notify(String message) => stdout.write('\x1b[32m$message\x1B[0m');

  @override
  void ring() => stdout.write('\x1b[32m🎵\x1B[0m');
}
