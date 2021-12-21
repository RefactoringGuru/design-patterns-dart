import '../bells/bell.dart';
import 'clock.dart';

class Interval extends Clock {
  Interval({required int seconds, required Bell bell})
      : super(bell: bell, seconds: seconds);

  @override
  void start() {
    Future.delayed(Duration(seconds: seconds), () async {
      showBell('Interval');
      for (var i = 0; i < 3 - 1; i++) {
        await Future.delayed(Duration(milliseconds: 500));
        bell.ring();
      }
      print('');
    });
  }
}
