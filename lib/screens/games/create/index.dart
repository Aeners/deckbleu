import 'package:app/screens/games/create/choosePlayer.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/games/common/burgerMenu.dart';
import 'package:app/utils/db.dart';

class CreateGameScreen extends StatefulWidget {
  static const routeName = '/games/create';

  @override
  _CreateGameScreenState createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  List<Player> playersSelected;

  handleAddPlayer(String value) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    var result = await helper.queryPlayerByName(value);
    setState(() {
      playersSelected = [...playersSelected, result];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qui joue ?'),
        // Remove back arrow
      ),
      drawer: BurgerMenu(),
      body: Column(children: <Widget>[ChoosePlayer(onSelect: handleAddPlayer)]),
    );
  }
}
