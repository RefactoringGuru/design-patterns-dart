import 'package:flutter/material.dart';

class HashGeneratorWidget extends StatelessWidget {
  final void Function() onHashGenerate;

  const HashGeneratorWidget({
    Key? key,
    required this.onHashGenerate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Generate new hash'),
      onPressed: onHashGenerate,
    );
  }
}
