import 'device.dart';

class Tv implements Device {
  bool _on = false;
  int _volume = 30;
  int _channel = 1;

  @override
  bool get isEnabled => _on;

  @override
  set isEnabled(bool enabled) => _on = enabled;

  @override
  int get volume => _volume;

  @override
  set volume(int percent) {
    if (volume > 100) {
      _volume = 100;
    } else if (volume < 0) {
      _volume = 0;
    } else {
      _volume = volume;
    }
  }

  @override
  int get channel => _channel;

  @override
  set channel(int channel) => _channel = channel;

  @override
  void printStatus() {
    print('------------------------------------');
    print('| I\'m TV set.');
    print('| I\'m ${_on ? 'enabled' : 'disabled'}');
    print('| Current volume is $_volume%');
    print('| Current channel is $_channel');
    print('------------------------------------\n');
  }
}
