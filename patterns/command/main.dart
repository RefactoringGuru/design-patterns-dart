import 'application/application.dart';
import 'commands/command.dart';

void main() {
  final app = Application();
  app.addListenerExecuteCommand(log);
  app
    ..keyboardInput('Hello world')
    ..textCursorMove(position: 6)
    ..keyboardInput('Refactring GuBu ')
    ..selectText(start: 17, end: 19)
    ..ctrlX()
    ..selectText(start: 17, end: 19)
    ..keyboardInput('Guru')
    ..selectText(start: 4, end: 5)
    ..ctrlC()
    ..textCursorMove(position: 12)
    ..ctrlV()
    ..textCursorMove(position: 28);

  print('\nUndo steps\n');

  while (app.isHistoryNotEmpty) {
    app.ctrlZ();
  }
}

void log(Command command, bool isUndo, String textAfter) {
  final addOrUndo = isUndo ? 'Undo_' : '[➕] ';
  final description = '$addOrUndo$command';
  print(description.padRight(72, '_') + '"$textAfter"');
}
