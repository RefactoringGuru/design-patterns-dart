import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../mixin/icon_box_mixin.dart';
import '../pattern/tool_factory.dart';

class Tools {
  final List<FactoryTool> factories;
  final List<Color> colors;

  final activeFactory = ValueNotifier<FactoryTool?>(null);

  final activeColor = ValueNotifier(Color(0x0FFFFFFFF));

  Future<bool> get iconsReady => _iconsInitCompleter.future;

  Tools({required this.factories, required this.colors}) {
    _initIconsFromShapes();

    if (factories.isNotEmpty) {
      activeFactory.value = factories.first;
    }

    if (colors.isNotEmpty) {
      activeColor.value = colors.first;
    }
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
