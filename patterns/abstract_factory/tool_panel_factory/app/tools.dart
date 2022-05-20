import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../mixin/icon_box_mixin.dart';
import '../pattern/tool_factory.dart';

class Tools {
  final List<ToolFactory> factories;
  final List<Color> colors;

  late final ValueNotifier<ToolFactory> activeFactory;

  late final ValueNotifier<Color> activeColor;

  Future<bool> get iconsReady => _iconsInitCompleter.future;

  Tools({required this.factories, required this.colors})
      : assert(factories.isNotEmpty),
        assert(colors.isNotEmpty) {
    activeFactory = ValueNotifier(factories.first);
    activeColor = ValueNotifier(colors.first);
    _initIconsFromShapes();
  }

  final _iconsInitCompleter = Completer<bool>();

  void _initIconsFromShapes() async {
    await Future.wait([
      for (final factory in factories)
        (factory as IconBoxMixin).updateIcon(activeColor.value),
    ]);
    _iconsInitCompleter.complete(Future.value(true));
  }
}
