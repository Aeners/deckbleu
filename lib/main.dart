import 'package:flutter/material.dart';
import 'package:app/screens/menu/index.dart';
import 'package:app/screens/users/create.dart';
import 'package:app/screens/game/index.dart';
import 'package:app/screens/settings/index.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => MenuScreen(),
      '/users/create': (context) => CreatePlayerScreen(),
      '/game': (context) => GameScreen(),
      '/settings': (context) => SettingScreen(),
    });
  }
}
