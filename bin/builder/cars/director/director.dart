import '../builders/builder.dart';
import '../cars/car_type.dart';
import '../components/engine.dart';
import 'gps_navigation.dart';
import 'transmission.dart';
import 'trip_computer.dart';

/// EN: Director defines the order of building steps. It works with a builder
/// object through common Builder interface. Therefore it may not know what
/// product is being built.
///
/// RU: Директор знает в какой последовательности заставлять работать строителя.
/// Он работает с ним через общий интерфейс Строителя. Из-за этого, он может не
/// знать какой конкретно продукт сейчас строится.
class Director {
  void constructSportsCar(Builder builder) {
    builder
      ..carType = CarType.sportCar
      ..seats = 2
      ..engine = Engine(3.0, 0)
      ..transmission = Transmission.semiAutomatic
      ..tripComputer = TripComputer()
      ..gpsNavigator = GPSNavigator();
  }

  void constructCityCar(Builder builder) {
    builder
      ..carType = CarType.cityCar
      ..seats = 2
      ..engine = Engine(1.2, 0)
      ..transmission = Transmission.automatic
      ..tripComputer = TripComputer()
      ..gpsNavigator = GPSNavigator();
  }

  void constructSUV(Builder builder) {
    builder
      ..carType = CarType.suv
      ..seats = 4
      ..engine = Engine(2.5, 0)
      ..transmission = Transmission.manual
      ..gpsNavigator = GPSNavigator();
  }
}
