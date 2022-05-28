import 'package:flutter/material.dart';

import 'components/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences in Flutter"),),
      body: Body(),
    );
  }
}
