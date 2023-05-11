import '../variable/bool_variable.dart';

class Context {
  void assign(BoolVariable variable, bool value) {
    _values.putIfAbsent(variable.name, () => value);
  }

  bool lookup(String name) {
    return _values[name]!;
  }

  final _values = <String, bool>{};
}
