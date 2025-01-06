import '../../app_observer/observer/event.dart';

class NewHashEvent extends Event {
  final String newHash;

  NewHashEvent(this.newHash);
}
