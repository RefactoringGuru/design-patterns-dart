import '../button/button.dart';
import '../checkbox/checkbox.dart';
import '../factories/gui_factory.dart';

class Application {
  late Button _button;
  late Checkbox _checkbox;

  Application(GUIFactory factory) {
    _button = factory.createButton();
    _checkbox = factory.createCheckbox();
  }

  void paint() {
    _button.paint();
    _checkbox.paint();
  }
}
