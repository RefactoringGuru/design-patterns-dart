import 'device.dart';

class EmptyDevice implements Device {
  @override
  int get channel => throw UnimplementedError('EmptyDevice');

  @override
  bool get isEnabled => throw UnimplementedError('EmptyDevice');

  @override
  int get volume => throw UnimplementedError('EmptyDevice');

  @override
  void printStatus() {
    print('------------------------------------');
    print('| Device is Empty');
    print('------------------------------------\n');
  }

  @override
  set channel(int channel) => throw UnimplementedError('EmptyDevice');

  @override
  set isEnabled(bool enabled) => throw UnimplementedError('EmptyDevice');

  @override
  set volume(int percent) => throw UnimplementedError('EmptyDevice');
}
