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
    _copyText = app.editor.selectedText;

    if (_copyText.isEmpty) {
      return;
    }

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
