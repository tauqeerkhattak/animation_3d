import 'package:flutter/material.dart';

import 'ui/home/home.dart';

void main() {
  runApp(const Animation3D());
}

class Animation3D extends StatelessWidget {
  const Animation3D({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
