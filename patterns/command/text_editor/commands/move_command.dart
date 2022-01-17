import '../application/application.dart';
import 'command.dart';

class MoveCommand extends Command {
  final int _positionTo;
  int? _positionFrom;

  MoveCommand(Application app, this._positionTo) : super(app);

  @override
  bool get isSaveHistory => false;

  @override
  void execute() {
    _positionFrom = app.editor.cursor.position;
    app.editor.cursorPosition = _positionTo;
  }

  @override
  void undo() {
    if (_positionFrom == null) {
      return;
    }

    app.editor.cursorPosition = _positionFrom!;
  }

  @override
  String toString() {
    return 'Move( '
        'from: $_positionFrom, '
        'to: $_positionTo )';
  }
}
