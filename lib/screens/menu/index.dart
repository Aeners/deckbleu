import 'package:flutter/material.dart';
import 'package:app/screens/menu/background.dart';
import 'package:app/screens/menu/options/index.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreen createState() => _MenuScreen();
}

class _MenuScreen extends State<MenuScreen> {
  bool showMenu = false;

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
        showMenu ? MenuOptions() : null
      ].where((Object o) => o != null).toList()),
    );
  }
}
