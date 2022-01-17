library copy_past;

import '../application/application.dart';
import 'command.dart';

part 'cut_command.dart';

class CopyCommand extends Command {
  String _copyText = '';

  CopyCommand(Application app) : super(app);

  @override
  bool get isSaveHistory => false;

  @override
  void execute() {
    if (!app.editor.cursor.isTextSelected) {
      return;
    }

    _copyText = app.editor.selectedText;
    app.clipboard = _copyText;
  }

  @override
  void undo() {}

  @override
  String toString() {
    return 'Copy( '
        'text: "$_copyText" )';
  }
}
