import '../buttons/button.dart';
import '../buttons/windows_button.dart';
import 'dialog.dart';

/// EN: Windows Dialog will produce Windows buttons.
///
/// RU: Диалог на элементах операционной системы.
class WindowsDialog extends Dialog {
  @override
  Button createButton(void Function() onClick) => WindowsButton(onClick);
}
