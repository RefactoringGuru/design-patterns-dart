import 'package:flutter/material.dart';

import '../app/tools.dart';
import 'colors_tool_bar.dart';
import 'factories_tool_bar.dart';

class ToolPanel extends StatelessWidget {
  final Tools tools;
  const ToolPanel({Key? key, required this.tools}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 12,
      top: 12,
      child: Column(
        children: [
          FactoriesToolBar(tools: tools),
          SizedBox(height: 24),
          ColorsToolBar(tools: tools),
        ],
      ),
    );
  }
}
