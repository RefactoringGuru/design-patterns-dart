import '../pattern/command.dart';
import '../mut_str/mut_str.dart';

class AddTextCommand implements Command {
  final String addedText;
  final MutStr mutStr;

  AddTextCommand(this.addedText, this.mutStr);

  @override
  void execute() {
    additionPosition = mutStr.len;
    mutStr.push(addedText);
  }

  @override
  void undo() {
    if (additionPosition == null) {
      return;
    }

    mutStr.delete(additionPosition!, additionPosition! + addedText.length);
  }

  int? additionPosition;
}
