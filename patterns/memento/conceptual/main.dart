import 'app/command.dart';
import 'app/editor.dart';

void main() {
  final editor = Editor('New Document');
  final firstState = Command.makeBackup(editor);
  editor.text += ' add text';
  final secondState = Command.makeBackup(editor);

  print('Current state: "${editor.text}"');

  firstState.undo();
  print('First state: "${editor.text}"');

  secondState.undo();
  print('Second state: "${editor.text}"');
}
