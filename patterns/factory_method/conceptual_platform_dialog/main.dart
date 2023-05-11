import 'dart:io';

import 'dialogs_factory/dialog.dart';
import 'dialogs_factory/html_dialog.dart';
import 'dialogs_factory/windows_dialog.dart';

late Dialog dialog;

void main() {
  configure();
  runBusinessLogic();
}

/// EN: The concrete factory is usually chosen depending on configuration or
/// environment options.
///
/// RU: Приложение создаёт определённую фабрику в зависимости от конфигурации
/// или окружения.
void configure() {
  if (Platform.isWindows) {
    dialog = WindowsDialog();
  } else {
    dialog = HtmlDialog();
  }
}

/// EN: All of the client code should work with factories and products
/// through abstract interfaces. This way it does not care which factory it
/// works with and what kind of product it returns.
///
/// RU: Весь остальной клиентский код работает с фабрикой и продуктами только
/// через общий интерфейс, поэтому для него неважно какая фабрика была
/// создана.
void runBusinessLogic() {
  dialog.renderWindow();
}
