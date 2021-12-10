import '../cars/car.dart';

/// EN: Just another feature of a car.
///
/// RU: Одна из фишек автомобиля.
class TripComputer {
  Car? car;

  void showFuelLevel() {
    print("Fuel level: ${car?.fuel}");
  }

  void showStatus() {
    final engine = car?.engine;
    if (engine != null && engine.isStarted) {
      print("Car is started");
    } else {
      print("Car isn't started");
    }
  }
}
