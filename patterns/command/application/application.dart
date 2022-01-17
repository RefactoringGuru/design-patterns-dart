import '../commands/command.dart';
import '../commands/copy_command.dart';
import '../commands/input_command.dart';
import '../commands/move_command.dart';
import '../commands/past_command.dart';
import '../commands/select_command.dart';
import 'command_history.dart';
import 'editor.dart';

typedef ExecuteCommandListener = Function(
  Command command,
  bool isUndo,
  String textAfter,
);

class Application {
  final editor = Editor();
  final _history = CommandHistory();

  String clipboard = '';

  void keyboardInput(String text) {
    executeAndPushHistory(
      InputCommand(this, text),
    );
  }

  void textCursorMove({required int position}) {
    executeAndPushHistory(
      MoveCommand(this, position),
    );
  }

  void selectText({required int start, required int end}) {
    executeAndPushHistory(
      SelectCommand(this, start, end),
    );
  }

  void ctrlC() {
    executeAndPushHistory(
      CopyCommand(this),
    );
  }

  void ctrlX() {
    executeAndPushHistory(
      CutCommand(this),
    );
  }

  void ctrlV() {
    executeAndPushHistory(
      PastCommand(this),
    );
  }

  bool get isHistoryNotEmpty => _history.isNotEmpty;

  void undo() {
    if (_history.isNotEmpty) {
      final command = _history.pop();
      command.undo();
      _executeListener(command, true, editor.text);
    }
  }

  void executeAndPushHistory(Command command) {
    command.execute();
    final textAfter = editor.text;
    _executeListener(command, false, textAfter);

    if (command.isSaveHistory) {
      _history.push(command);
    }
  }

  // ignore: prefer_function_declarations_over_variables
  ExecuteCommandListener _executeListener = (_, __, ___) {};

  void addListenerExecuteCommand(ExecuteCommandListener listener) {
    _executeListener = listener;
  }
}
