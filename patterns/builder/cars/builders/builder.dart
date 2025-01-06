import '../cars/car_type.dart';
import '../components/engine.dart';
import '../director/gps_navigation.dart';
import '../director/transmission.dart';
import '../director/trip_computer.dart';

/// EN: Builder interface defines all possible ways to configure a product.
///
/// RU: Интерфейс Строителя объявляет все возможные этапы и шаги конфигурации
/// продукта.
abstract class Builder {
  set carType(CarType type);

  set seats(int seats);

  set engine(Engine engine);

  set transmission(Transmission transmission);

  set tripComputer(TripComputer tripComputer);

  set gpsNavigator(GPSNavigator gpsNavigator);
}
