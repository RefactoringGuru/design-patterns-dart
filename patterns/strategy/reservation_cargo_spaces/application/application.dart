import '../partners/cargo.dart';
import '../partners/voyage.dart';
import '../policy/overbooking_policy.dart';
import 'order_confirmation_sequence.dart';

class Application {
  final OverbookingPolicy overbookingPolicy;
  final orderConfirmationSequence = OrderConfirmationSequence();

  Application(this.overbookingPolicy);

  void makeBooking(Cargo cargo, Voyage voyage) {
    if (overbookingPolicy.isAllowed(cargo, voyage)) {
      final confirmation = orderConfirmationSequence.next();
      voyage.addCargo(cargo, confirmation);
    } else {
      throw 'The weight of the cargo exceeds the permissible norm.';
    }
  }
}
