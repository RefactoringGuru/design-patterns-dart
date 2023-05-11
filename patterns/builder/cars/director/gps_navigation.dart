/// EN: Just another feature of a car.
///
/// RU: Одна из фишек автомобиля.
class GPSNavigator {
  late String _route;

  GPSNavigator()
      : _route = "221b, Baker Street, London "
            "to Scotland Yard, 8-10 Broadway, London";

  GPSNavigator.fromRout(String manualRoute) {
    _route = manualRoute;
  }

  String get root => _route;
}
