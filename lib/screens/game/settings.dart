import 'package:flutter/material.dart';

class GameSettingsScreen extends StatelessWidget {
  static const routeName = '/game/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Qui joue ?')),
      body: Center(
        child: Text('HELLO'),
      ),
    );
  }
}
