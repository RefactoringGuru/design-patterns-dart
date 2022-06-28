import 'operation.dart';

class Or extends Operation {
  Or(super.expression1, super.expression2);

  @override
  bool operation(bool a, bool b) => a || b;
}
