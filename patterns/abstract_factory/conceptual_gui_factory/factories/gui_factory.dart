import 'dart:io';

import '../button/button.dart';
import '../checkbox/checkbox.dart';
import 'mac_os_factory.dart';
import 'window_factory.dart';

abstract class GUIFactory {
  factory GUIFactory() {
    if (Platform.isMacOS) {
      return MacOSFactory();
    } else {
      return WindowsFactory();
    }
  }

  Button createButton();

  Checkbox createCheckbox();
}
