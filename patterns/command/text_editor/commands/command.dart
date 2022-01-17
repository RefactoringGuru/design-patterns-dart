import '../application/application.dart';

abstract class Command {
  final Application app;

  Command(this.app);

  bool get isSaveHistory;

  void execute();

  void undo();
}
