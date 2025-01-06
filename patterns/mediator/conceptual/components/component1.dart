import '../pattern/mediator.dart';

class Component1 extends Component {
  final sate = 'Cmp1';

  void doOne() {
    print('call Component1.doOne()');
    mediator?.notify(this, 'doOne');
  }
}
