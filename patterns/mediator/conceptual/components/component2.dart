import '../pattern/mediator.dart';

class Component2 extends Component {
  final name = 'Two';

  void doTwo() {
    print('call Component2.doTwo()');
    mediator?.notify(this, 'doTwo');
  }
}
