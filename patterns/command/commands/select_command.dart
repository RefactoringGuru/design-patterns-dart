import '../application/application.dart';
import 'command.dart';

class SelectCommand extends Command {
  final int _start;
  final int _end;

  int? _oldStart;
  int? _oldEnd;

  SelectCommand(Application app, this._start, this._end) : super(app);

  @override
  bool get isSaveHistory => false;

  @override
  void execute() {
    _oldStart = app.editor.startSelection;
    _oldEnd = app.editor.textCursorPosition;
    app.editor.selectText(_start, _end);
  }

  @override
  void undo() {
    if (_oldEnd == null) {
      return;
    }

    final noSelection = _oldStart == null;

    if (noSelection) {
      app.editor.textCursorPosition = _oldEnd!;
    } else {
      app.editor.selectText(_oldStart!, _oldEnd!);
    }
  }

  @override
  String toString() {
    return 'Select( '
        'start: $_start, '
        'end: $_end )';
  }
}
