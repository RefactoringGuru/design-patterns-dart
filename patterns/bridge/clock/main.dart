import 'bells/melody.dart';
import 'bells/signal.dart';
import 'clocks/once.dart';
import 'clocks/clock.dart';
import 'clocks/interval.dart';

void main() {
  final melody = Melody();
  final signal = Signal();
  startClocks([
    Once(seconds: 1, bell: melody),
    Once(seconds: 2, bell: signal),
    Interval(seconds: 5, bell: melody),
    Interval(seconds: 3, bell: signal),
  ]);
}

void startClocks(List<Clock> clocks) {
  for (final clock in clocks) {
    clock.start();
  }
}
