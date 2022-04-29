import 'app/application.dart';
import 'factories/gui_factory.dart';

void main() {
  final guiFactory = GUIFactory();
  final app = Application(guiFactory);
  app.paint();
}
