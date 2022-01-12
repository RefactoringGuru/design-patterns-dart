/// EN: Just another feature of a car.
///
/// RU: Одна из фишек автомобиля.
class Engine {
  final double volume;

  double _mileage;

  double get mileage => _mileage;

  var _started = false;

  Engine(this.volume, this._mileage);

  void on() => _started = true;

  void off() => _started = false;

  bool get isStarted => _started;

  void go(double mileage) {
    if (_started) {
      _mileage += mileage;
    } else {
      print('Cannot go(), you must start engine first!');
    }
  }
}
