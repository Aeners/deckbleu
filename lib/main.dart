import 'package:flutter/material.dart';
import 'package:app/screens/menu/index.dart';
import 'package:app/screens/users/create/index.dart';
import 'package:app/screens/game/create.dart';
import 'package:app/screens/settings/index.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      MenuScreen.routeName: (context) => MenuScreen(),
      CreatePlayerScreen.routeName: (context) => CreatePlayerScreen(),
      CreateGameScreen.routeName: (context) => CreateGameScreen(),
      SettingScreen.routeName: (context) => SettingScreen(),
    });
  }
}
