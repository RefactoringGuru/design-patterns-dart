import '../cars/car_manual.dart';
import '../cars/car_type.dart';
import '../components/engine.dart';
import '../director/gps_navigation.dart';
import '../director/transmission.dart';
import '../director/trip_computer.dart';
import 'builder.dart';

/// EN: Unlike other creational patterns, Builder can construct unrelated
/// products, which don't have the common interface.
///
/// In this case we build a user manual for a car, using the same steps as we
/// built a car. This allows to produce manuals for specific car models,
/// configured with different features.
///
/// RU: В отличие от других создающих паттернов, Строители могут создавать
/// совершенно разные продукты, не имеющие общего интерфейса.
///
/// В данном случае мы производим руководство пользователя автомобиля с помощью
/// тех же шагов, что и сами автомобили. Это устройство позволит создавать
/// руководства под конкретные модели автомобилей, содержащие те или иные фичи.
class CarManualBuilder implements Builder {
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

  Manual getResult() {
    return Manual(
        carType!, seats!, engine!, transmission!, tripComputer!, gpsNavigator!);
  }
}
