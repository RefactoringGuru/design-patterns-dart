import 'operation.dart';

class And extends Operation {
  And(super.expression1, super.expression2);

  @override
  bool operation(bool a, bool b) => a && b;
}
