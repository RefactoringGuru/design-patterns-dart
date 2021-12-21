import '../components/engine.dart';
import '../director/gps_navigation.dart';
import '../director/transmission.dart';
import '../director/trip_computer.dart';
import 'car_type.dart';

/// EN: Car manual is another product. Note that it does not have the same
/// ancestor as a Car. They are not related.
///
/// RU: Руководство автомобиля — это второй продукт. Заметьте, что руководство и
/// сам автомобиль не имеют общего родительского класса. По сути, они независимы.

class Manual {
  CarType carType;

  final int seats;

  final Engine engine;

  final Transmission transmission;

  final TripComputer? tripComputer;

  final GPSNavigator? gpsNavigator;

  Manual(
    this.carType,
    this.seats,
    this.engine,
    this.transmission, [
    this.tripComputer,
    this.gpsNavigator,
  ]);

  String print() {
    var info = '';
    info += 'Type of car: $carType\n';
    info += 'Count of seats: $seats\n';
    info += 'Engine: volume - ${engine.volume}; mileage - ${engine.mileage}\n';
    info += 'Transmission: $transmission\n';
    if (tripComputer != null) {
      info += 'Trip Computer: Functional\n';
    } else {
      info += 'Trip Computer: N/A\n';
    }
    if (gpsNavigator != null) {
      info += 'GPS Navigator: Functional\n';
    } else {
      info += 'GPS Navigator: N/A\n';
    }
    return info;
  }
}
