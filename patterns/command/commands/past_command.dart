import '../application/application.dart';
import 'command.dart';

class PastCommand extends Command {
  String _text = '';
  String _selectText = '';
  int? _textCursorPosition;

  PastCommand(Application app) : super(app);

  @override
  bool get isSaveHistory => _text.isNotEmpty;

  @override
  void execute() {
    if (app.clipboard.isEmpty) {
      return;
    }

    _selectText = app.editor.selectedText;
    _text = app.clipboard;
    app.editor.inputText(_text);
    _textCursorPosition = app.editor.cursor.position;
  }

  @override
  void undo() {
    if (_text.isEmpty) {
      return;
    }

    app.editor
      ..selectText(
        _textCursorPosition! - _text.length,
        _textCursorPosition!,
      )
      ..inputText(_selectText);
  }

  @override
  String toString() {
    return 'Past( '
        'cursorPosition: $_textCursorPosition, '
        'text: "$_text", '
        'pevRestore: "$_selectText" )';
  }
}
