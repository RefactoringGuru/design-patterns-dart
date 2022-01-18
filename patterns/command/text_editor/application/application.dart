import '../commands/command.dart';
import '../commands/copy_command.dart';
import '../commands/input_command.dart';
import '../commands/move_command.dart';
import '../commands/past_command.dart';
import '../commands/select_command.dart';
import 'command_history.dart';
import 'editor.dart';

typedef ExecuteCommandListener = Function({
  required Command command,
  required bool isUndo,
  required String editorText,
});

class Application {
  final editor = Editor();
  final _history = CommandHistory();

  String clipboard = '';

  void keyboardInput(String text) {
    _executeAndPushHistory(
      InputCommand(this, text),
    );
  }

  void moveCursor({required int position}) {
    _executeAndPushHistory(
      MoveCommand(this, position),
    );
  }

  void selectText({required int start, required int end}) {
    _executeAndPushHistory(
      SelectCommand(this, start, end),
    );
  }

  void ctrlC() {
    _executeAndPushHistory(
      CopyCommand(this),
    );
  }

  void ctrlX() {
    _executeAndPushHistory(
      CutCommand(this),
    );
  }

  void ctrlV() {
    _executeAndPushHistory(
      PastCommand(this),
    );
  }

  void ctrlZ() {
    if (_history.isNotEmpty) {
      final command = _history.pop();
      command.undo();
      _executeListener?.call(
        command: command,
        isUndo: true,
        editorText: editor.toString(),
      );
    }
  }

  bool get isHistoryNotEmpty => _history.isNotEmpty;

  void _executeAndPushHistory(Command command) {
    command.execute();
    final textAfterExecute = editor.toString();
    _executeListener?.call(
      command: command,
      isUndo: false,
      editorText: textAfterExecute,
    );

    if (command.isSaveHistory) {
      _history.push(command);
    }
  }

  // ignore: prefer_function_declarations_over_variables
  ExecuteCommandListener? _executeListener;

  void addListenerExecuteCommand(ExecuteCommandListener listener) {
    _executeListener = listener;
  }
}
