import '../commands/command.dart';
import '../commands/copy_command.dart';
import '../commands/input_keyboard_command.dart';
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
  final history = CommandHistory();

  String clipboard = '';

  void keyboardInput(String text) {
    executeAndPushHistoryAnd(
      InputCommand(this, text),
    );
  }

  void textCursorMove({required int position}) {
    executeAndPushHistoryAnd(
      MoveCommand(this, position),
    );
  }

  void selectText({required int start, required int end}) {
    executeAndPushHistoryAnd(
      SelectCommand(this, start, end),
    );
  }

  void ctrlC() {
    executeAndPushHistoryAnd(
      CopyCommand(this),
    );
  }

  void ctrlX() {
    executeAndPushHistoryAnd(
      CutCommand(this),
    );
  }

  void ctrlV() {
    executeAndPushHistoryAnd(
      PastCommand(this),
    );
  }

  void undo() {
    if (history.isNotEmpty) {
      final command = history.pop();
      command.undo();
      final textAfter = editor.text;
      _executeListener(command, true, textAfter);
    }
  }

  void executeAndPushHistoryAnd(Command command) {
    command.execute();
    final textAfter = editor.text;
    _executeListener(command, false, textAfter);

    if (command.isSaveHistory) {
      history.push(command);
    }
  }

  // ignore: prefer_function_declarations_over_variables
  ExecuteCommandListener _executeListener = (_, __, ___) {};

  void addListenerExecuteCommand(ExecuteCommandListener listener) {
    _executeListener = listener;
  }
}
