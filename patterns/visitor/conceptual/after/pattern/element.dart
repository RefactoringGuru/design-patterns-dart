import 'visitor.dart';

abstract class Element {
  void accept(Visitor visitor);
}
