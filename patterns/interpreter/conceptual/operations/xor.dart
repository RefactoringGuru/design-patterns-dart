import 'operation.dart';

class Xor extends Operation {
  Xor(super.expression1, super.expression2);

  @override
  bool operation(bool a, bool b) => a ^ b;
}
