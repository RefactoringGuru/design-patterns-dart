import 'package:flutter/widgets.dart';


import '../classic_app/classic_app.dart';
import 'classic_app_render_object.dart';

class ClassicAppAdapterWidget extends LeafRenderObjectWidget {
  final ClassicApp classicApp;

  ClassicAppAdapterWidget({required this.classicApp});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ClassicAppRenderObject(classicApp);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant ClassicAppRenderObject renderObject,
  ) {
    renderObject.classicApp = classicApp;
  }
}
