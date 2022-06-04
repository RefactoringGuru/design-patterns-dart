import '../pattern/switcher.dart';
import 'one.dart';

class Three extends State {
  @override
  void call() {
    print('call(${context.calls}): Three');
    context.changeState(One());
  }
}
