import '../button/button.dart';
import '../checkbox/checkbox.dart';
import '../button/windows_button.dart';
import '../checkbox/windows_checkbox.dart';
import 'gui_factory.dart';

class WindowsFactory implements GUIFactory {
  @override
  Button createButton() => WindowsButton();

  @override
  Checkbox createCheckbox() => WindowsCheckbox();
}
