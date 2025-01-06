import '../pattern/switcher.dart';
import 'three.dart';

class Two extends State {
  @override
  void call() {
    print('call(${context.calls}): Two');
    context.changeState(Three());
  }
}
