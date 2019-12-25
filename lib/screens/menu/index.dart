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

  @override
  void initState() {
    _getNumberOfPlayers();
    super.initState();
  }

  _getNumberOfPlayers() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int players = await helper.queryNumberOfPlayers();
    print("Number of Players => $players");
    if (players >= 2) {
      enoughPlayers = true;
    } else {
      print('Not enough player to play');
    }
  }

  _handleImageOnTap() {
    setState(() {
      showMenu = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
        BackgroundImage(handleOnTap: _handleImageOnTap),
        showMenu ? MenuOptions(canPlay: enoughPlayers) : null
      ].where((Object o) => o != null).toList()),
    );
  }
}
