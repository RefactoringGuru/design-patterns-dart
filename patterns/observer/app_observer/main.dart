import 'observer/app_observer.dart';
import 'observer/event.dart';

class FirstEvent extends Event {}

class SecondEvent extends Event {}

class ThirdEvent extends Event {}

void main() {
  final observer = AppObserver();

  observer.subscribe<FirstEvent>((e) {
    print('First');
  });

  observer.subscribe((SecondEvent e) {
    print('Second');
  });

  final saveThirdEvent = observer.subscribe((ThirdEvent e) {
    print('Third');
  });

  observer.notify(FirstEvent());
  observer.notify(SecondEvent());
  observer.notify(ThirdEvent());

  print('---unsubscribe "ThirdEvent"---');
  observer.unsubscribe(saveThirdEvent);

  observer.notify(FirstEvent());
  observer.notify(SecondEvent());
  observer.notify(ThirdEvent());
}
