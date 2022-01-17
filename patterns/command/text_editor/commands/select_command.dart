import '../application/application.dart';
import '../application/text_cursor.dart';
import 'command.dart';

class SelectCommand extends Command {
  final int _start;
  final int _end;

  TextCursor? _previousCursor;

  SelectCommand(Application app, this._start, this._end) : super(app);

  @override
  bool get isSaveHistory => false;

  @override
  void execute() {
    _previousCursor = app.editor.cursor;
    app.editor.selectText(_start, _end);
  }

  @override
  void undo() {
    if (_previousCursor == null) {
      return;
    }

    app.editor.selectText(
      _previousCursor!.startSelection,
      _previousCursor!.endSelection,
    );
  }

  @override
  String toString() {
    return 'Select( '
        'start: $_start, '
        'end: $_end )';
  }
}
