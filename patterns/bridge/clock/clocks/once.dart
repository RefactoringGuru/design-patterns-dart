import '../bells/bell.dart';
import 'clock.dart';

class Once extends Clock {
  Once({required int seconds, required Bell bell})
      : super(seconds: seconds, bell: bell);

  @override
  void start() {
    Future.delayed(Duration(seconds: seconds), () {
      showBell('Once');
      print('');
    });
  }
}
