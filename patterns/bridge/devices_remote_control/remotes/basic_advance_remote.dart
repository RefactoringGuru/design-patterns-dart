import '../devices/device.dart';
import '../devices/empty_device.dart';
import 'remote.dart';

class BasicRemote implements Remote {
  final Device _device;

  BasicRemote() : _device = EmptyDevice();

  BasicRemote.fromDevice(this._device);

  @override
  void power() {
    if (_device is EmptyDevice) {
      print('Remote: power(device not found)');
      return;
    }
    print('Remote: power toggle');
    _device.isEnabled = !_device.isEnabled;
  }

  @override
  void volumeDown() {
    if (_device is EmptyDevice) {
      print('Remote: volumeDown(device not found)');
      return;
    }
    print("Remote: volume down");
    _device.volume -= 10;
  }

  @override
  void volumeUp() {
    if (_device is EmptyDevice) {
      print('Remote: volumeDown(device not found)');
      return;
    }
    print("Remote: volume up");
    _device.volume += 10;
  }

  @override
  void channelDown() {
    if (_device is EmptyDevice) {
      print('Remote: channelDown(device not found)');
      return;
    }
    print("Remote: channel down");
    _device.channel -= 1;
  }

  @override
  void channelUp() {
    if (_device is EmptyDevice) {
      print('Remote: channelUp(device not found)');
      return;
    }
    print("Remote: channel up");
    _device.channel += 1;
  }
}

class AdvancedRemote extends BasicRemote {
  AdvancedRemote() : super();

  AdvancedRemote.fromDevice(Device device) : super.fromDevice(device);

  void mute() {
    if (_device is EmptyDevice) {
      print('Remote: mute(device not found)');
      return;
    }
    print("Remote: mute");
    _device.volume = 0;
  }
}
