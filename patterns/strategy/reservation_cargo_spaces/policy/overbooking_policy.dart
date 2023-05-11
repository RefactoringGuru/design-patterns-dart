import '../partners/cargo.dart';
import '../partners/voyage.dart';

class OverbookingPolicy {
  static const allowableRedundancy = 1.1;

  bool isAllowed(Cargo cargo, Voyage voyage) {
    final maxBooking = voyage.capacity * allowableRedundancy;
    final futureWeight = voyage.bookedCargoSize() + cargo.size;

    return futureWeight < maxBooking;
  }
}
