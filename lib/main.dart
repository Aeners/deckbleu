import 'package:flutter/material.dart';
import 'package:app/screens/menu/index.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => MenuScreen(),
    });
  }
}
