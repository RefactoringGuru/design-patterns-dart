import '../pattern/element.dart';
import '../pattern/visitor.dart';

class Two implements Element {
  final String param2 = '2';

  @override
  void accept(Visitor visitor) {
    visitor.visitTwo(this);
  }
}
