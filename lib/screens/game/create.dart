import 'package:flutter/material.dart';
import 'package:app/screens/game/common/burgerMenu.dart';

class CreateGameScreen extends StatelessWidget {
  static const routeName = '/game/create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qui joue ?'),
        // Remove back arrow
      ),
      drawer: BurgerMenu(),
      body: Center(
        child: Text('HELLO'),
      ),
    );
  }
}
