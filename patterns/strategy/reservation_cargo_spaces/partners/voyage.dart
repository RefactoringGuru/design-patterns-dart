import 'cargo.dart';

class Voyage {
  final _cargo = <int, Cargo>{};

  double get capacity => 2000.0;

  double bookedCargoSize() {
    return _cargo.values.fold(0, (prev, cargo) => prev + cargo.size);
  }

  void addCargo(Cargo cargo, int confirmation) {
    _cargo.putIfAbsent(confirmation, () => cargo);
    print('Add Cargo(${cargo.size}) to voyage.');
  }
}
