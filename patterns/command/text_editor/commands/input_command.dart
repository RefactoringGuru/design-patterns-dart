import '../application/application.dart';
import 'command.dart';

class InputCommand extends Command {
  final String _addText;
  int? _startPosition;
  String _prevSelectText = '';

  InputCommand(Application app, this._addText) : super(app);

  @override
  bool get isSaveHistory => _addText.isNotEmpty;

  @override
  void execute() {
    _prevSelectText = app.editor.selectedText;
    _startPosition = app.editor.cursor.startSelection;
    app.editor.inputText(_addText);
  }

  @override
  void undo() {
    app.editor
      ..selectText(_startPosition!, _startPosition! + _addText.length)
      ..inputText(_prevSelectText);
  }

  @override
  String toString() {
    return 'Input( '
        'cursorPosition: $_startPosition, '
        'addText: "$_addText" )';
  }
}
