import 'devices/device.dart';
import 'devices/empty_device.dart';
import 'devices/radio.dart';
import 'devices/tv.dart';
import 'remotes/basic_advance_remote.dart';

void main() {
  testDevice(Tv());
  testDevice(Radio());
  testDevice(EmptyDevice());
}

void testDevice(Device device) {
  print(''.padRight(36, '='));
  print(device.runtimeType);
  print("Tests with basic remote.");
  final basicRemote = BasicRemote.fromDevice(device);
  basicRemote.power();
  device.printStatus();

  print("Tests with advanced remote.");
  final advancedRemote = AdvancedRemote.fromDevice(device);
  advancedRemote.power();
  advancedRemote.mute();
  device.printStatus();
}
