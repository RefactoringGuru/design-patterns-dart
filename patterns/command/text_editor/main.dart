import 'application/application.dart';
import 'commands/command.dart';

void main() {
  final app = Application();
  app.addListenerExecuteCommand(log);
  app
    ..keyboardInput('Hello world')
    ..moveCursor(position: 6)
    ..keyboardInput('Refactring GuBu ')
    ..selectText(start: 17, end: 19)
    ..ctrlX()
    ..selectText(start: 17, end: 19)
    ..keyboardInput('Guru')
    ..selectText(start: 4, end: 5)
    ..ctrlC()
    ..moveCursor(position: 12)
    ..ctrlV()
    ..moveCursor(position: 28);

  print('\nUndo steps\n');

  while (app.isHistoryNotEmpty) {
    app.ctrlZ();
  }
}

void log({
  required Command command,
  required bool isUndo,
  required String editorText,
}) {
  final addOrUndo = isUndo ? 'Undo_' : '[➕] ';
  final description = '$addOrUndo$command';
  print('${description.padRight(72, '_')}"$editorText"');
}
