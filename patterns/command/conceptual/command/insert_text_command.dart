import '../pattern/command.dart';
import '../mut_str/mut_str.dart';

class InsertTextCommand extends Command {
  final int pos;
  final String insertText;
  final MutStr mutStr;

  InsertTextCommand(this.insertText, this.mutStr, {required this.pos});

  @override
  void execute() {
    _isNotExecute = false;
    mutStr.insert(pos + 1, insertText);
  }

  @override
  void undo() {
    if (_isNotExecute) {
      return;
    }

    mutStr.delete(pos + 1, insertText.length - 1);
  }

  bool _isNotExecute = true;
}
