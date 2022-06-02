import 'package:flutter/services.dart';

class KeyboardActions {
  final Map<PhysicalKeyboardKey, void Function()> actions;
  final void Function(String) inputCharAction;

  KeyboardActions({
    required this.actions,
    required this.inputCharAction,
  });

  void keyDown(KeyEvent keyEvent) {
    final isNotKeyDown =
        !(keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent);

    if (isNotKeyDown) {
      return;
    }

    final foundEvent = actions[keyEvent.physicalKey];

    if (foundEvent != null) {
      foundEvent.call();
      return;
    }

    if (keyEvent.character != null) {
      inputCharAction.call(keyEvent.character!);
    }
  }
}
