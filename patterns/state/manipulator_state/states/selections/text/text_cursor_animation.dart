import 'dart:async';

class TextCursorAnimation {
  final Duration speed;
  final void Function() onBlink;

  TextCursorAnimation({
    required this.speed,
    required this.onBlink,
  }) {
    _timer = Timer.periodic(speed, (_) {
      _isShowCursor = !_isShowCursor;
      onBlink.call();
    });
  }

  bool get isVisible => _isShowCursor;

  void touch() {
    _isShowCursor = true;
    onBlink.call();
  }

  void dispose() {
    _timer.cancel();
  }

  bool _isShowCursor = true;
  late Timer _timer;
}
