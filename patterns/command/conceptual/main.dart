import 'mut_str/mut_str.dart';
import 'command/add_text_command.dart';
import 'command/insert_text_command.dart';

void main() {
  final mutStr = MutStr();

  final input1 = AddTextCommand('One', mutStr);
  final input2 = AddTextCommand('Three', mutStr);
  final input3 = InsertTextCommand(' Two ', mutStr, pos: 2);

  input1.execute();
  print('text = $mutStr'); // mutStr = "One"

  input2.execute();
  print('text = $mutStr'); // mutStr = "OneThree"

  input3.execute();
  print('text = $mutStr'); // mutStr = "One Two Three"

  input3.undo();
  print('text = $mutStr'); // mutStr = "OneThree"

  input2.undo();
  print('text = $mutStr'); // mutStr = "One "

  input1.undo();
  print('text = $mutStr'); // mutStr = ""
}
