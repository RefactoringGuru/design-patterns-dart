import 'package:flutter/material.dart';

import '../app/tools.dart';
import 'independent/tool_bar.dart';
import 'independent/tool_button.dart';

class FactoriesToolBar extends StatelessWidget {
  final Tools tools;

  const FactoriesToolBar({Key? key, required this.tools}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolBar(
      title: 'factories',
      child: FutureBuilder(
        future: tools.iconsReady,
        builder: (_, snapshot) {
          return snapshot.hasData
              ? _buildToolButtons()
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _buildToolButtons() {
    return ValueListenableBuilder(
      valueListenable: tools.activeFactory,
      builder: (_, activeFactory, __) {
        return Column(
          children: [
            for (final factory in tools.factories)
              ToolButton(
                icon: factory.icon,
                active: factory == activeFactory,
                onTap: () => tools.activeFactory.value = factory,
              ),
          ],
        );
      },
    );
  }
}
