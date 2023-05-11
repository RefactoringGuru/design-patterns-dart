import '../bells/bell.dart';

abstract class Clock {
  final int seconds;
  final Bell bell;

  Clock({
    required this.seconds,
    required this.bell,
  });

  void start();

  void showBell(String message) {
    bell.notify('$message(sec: $seconds): ');
    bell.ring();
  }
}
