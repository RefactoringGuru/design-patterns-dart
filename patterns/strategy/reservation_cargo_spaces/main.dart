import 'application/application.dart';
import 'partners/cargo.dart';
import 'partners/voyage.dart';
import 'policy/overbooking_policy.dart';

void main() {
  final overbookingPolicy = OverbookingPolicy();
  final app = Application(overbookingPolicy);
  final voyage = Voyage();

  try {
    app.makeBooking(Cargo(1000), voyage);
    app.makeBooking(Cargo(500), voyage);
    app.makeBooking(Cargo(800), voyage); // error
  } catch (e) {
    print(e);
  }
}
