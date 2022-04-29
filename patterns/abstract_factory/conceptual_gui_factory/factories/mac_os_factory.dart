import '../button/button.dart';
import '../checkbox/checkbox.dart';
import '../button/mac_os_button.dart';
import '../checkbox/mac_os_checkbox.dart';
import 'gui_factory.dart';

class MacOSFactory implements GUIFactory {
  @override
  Button createButton() => MacOSButton();

  @override
  Checkbox createCheckbox() => MacOSCheckbox();
}
