import '../components/engine.dart';
import '../director/gps_navigation.dart';
import '../director/transmission.dart';
import '../director/trip_computer.dart';
import 'car_type.dart';

/// EN: Car is a product class.
///
/// RU: Автомобиль — это класс продукта.
class Car {
  final CarType carType;

  final int seats;

  final Engine engine;

  final Transmission transmission;

  final TripComputer tripComputer;

  final GPSNavigator gpsNavigator;

  final double fuel = 0.0;

  Car(
    this.carType,
    this.seats,
    this.engine,
    this.transmission,
    this.tripComputer,
    this.gpsNavigator,
  ) {
    tripComputer.car = this;
  }
}
