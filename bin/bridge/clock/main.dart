import 'bells/melody.dart';
import 'bells/signal.dart';
import 'clocks/once.dart';
import 'clocks/clock.dart';
import 'clocks/interval.dart';

void main() {
  final onceMelody = Once(seconds: 1, bell: Melody());
  final onceSignal = Once(seconds: 2, bell: Signal());
  final intervalMelody = Interval(seconds: 5, bell: Melody());
  final intervalSignal = Interval(seconds: 3, bell: Signal());
  startAlarm([
    onceMelody,
    onceSignal,
    intervalMelody,
    intervalSignal,
  ]);
}

void startAlarm(List<Clock> clocks) {
  for (var i = 0; i < clocks.length; i++) {
    clocks[i].start();
  }
}
