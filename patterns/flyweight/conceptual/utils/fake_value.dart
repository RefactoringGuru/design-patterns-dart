import 'dart:math';

String str = 'abcdef';
get fakeString {
  final char = str[Random().nextInt(str.length - 1)];
  str = str.replaceFirst(char, '');
  return char;
}

get fakeInt => Random().nextInt(100);

get fakeDouble => Random().nextInt(100) / 100;
