import '../pattern/switcher.dart';
import 'two.dart';

class One extends State {
  @override
  void call() {
    print('call(${context.calls}): One');
    context.changeState(Two());
  }
}
