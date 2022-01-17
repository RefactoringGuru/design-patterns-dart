part of copy_past;

class CutCommand extends CopyCommand {
  int? _textCursorPosition;

  CutCommand(Application app) : super(app);

  @override
  bool get isSaveHistory => _copyText.isNotEmpty;

  @override
  void execute() {
    super.execute();

    if (_copyText.isEmpty) {
      return;
    }

    app.editor.removeSelected();
    _textCursorPosition = app.editor.textCursorPosition;

  }

  @override
  void undo() {
    if (_copyText.isEmpty) {
      return;
    }

    app.editor
      ..textCursorPosition = _textCursorPosition!
      ..inputText(_copyText);
  }

  @override
  String toString() {
    return 'Cut( '
        'cursorPosition: $_textCursorPosition, '
        'cutText: "$_copyText" )';
;
  }
}
