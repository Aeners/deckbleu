import 'package:flutter/material.dart';
import 'package:app/screens/menu/background.dart';
import 'package:app/screens/menu/options/index.dart';
import 'package:app/utils/db.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreen createState() => _MenuScreen();
}

class _MenuScreen extends State<MenuScreen> {
  bool showMenu = false;
  bool enoughPlayers = false;
  DatabaseHelper helper = DatabaseHelper.instance;

  _getNumberOfPlayers() async {
    int players = await helper.queryNumberOfPlayers();
    if (players >= 2 && !enoughPlayers) {
      setState(() => enoughPlayers = true);
    } else if (players < 2) {
      print('Not enough player to play');
    }
  }

  _handleImageOnTap() {
    setState(() => showMenu = true);
  }

  @override
  Widget build(BuildContext context) {
    _getNumberOfPlayers();
    return Scaffold(
      body: Stack(
          children: <Widget>[
        BackgroundImage(handleOnTap: _handleImageOnTap),
        showMenu ? MenuOptions(canPlay: enoughPlayers) : null
      ].where((Object o) => o != null).toList()),
    );
  }
}
