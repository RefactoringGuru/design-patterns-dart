abstract class Device {
  bool get isEnabled;

  set isEnabled(bool enabled);

  int get volume;

  set volume(int percent);

  int get channel;

  set channel(int channel);

  void printStatus();
}
