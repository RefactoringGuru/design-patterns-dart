part of copy_past;

class CutCommand extends CopyCommand {
  int? _cursorPosition;

  CutCommand(Application app) : super(app);

  @override
  bool get isSaveHistory => _copyText.isNotEmpty;

  @override
  void execute() {
    if (!app.editor.cursor.isTextSelected) {
      return;
    }

    super.execute();
    app.editor.removeSelected();
    _cursorPosition = app.editor.cursor.position;
  }

  @override
  void undo() {
    if (_copyText.isEmpty) {
      return;
    }

    app.editor
      ..cursorPosition = _cursorPosition!
      ..inputText(_copyText);
  }

  @override
  String toString() {
    return 'Cut( '
        'cursorPosition: $_cursorPosition, '
        'cutText: "$_copyText" )';
  }
}
