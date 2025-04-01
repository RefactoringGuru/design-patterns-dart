import '../cars/car.dart';
import '../cars/car_type.dart';
import '../components/engine.dart';
import '../director/gps_navigation.dart';
import '../director/transmission.dart';
import '../director/trip_computer.dart';
import 'builder.dart';

/// EN: Concrete builders implement steps defined in the common interface.
///
/// RU: Конкретные строители реализуют шаги, объявленные в общем интерфейсе.
class CarBuilder implements Builder {
  @override
  CarType? carType;

  @override
  int? seats;

  @override
  Engine? engine;

  @override
  Transmission? transmission;

  @override
  TripComputer? tripComputer;

  @override
  GPSNavigator? gpsNavigator;

  Car getResult() {
    return Car(
        carType!, seats!, engine!, transmission!, tripComputer!, gpsNavigator!);
  }
}
