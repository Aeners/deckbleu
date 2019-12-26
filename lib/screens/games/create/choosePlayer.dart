import 'package:flutter/material.dart';
import 'package:app/screens/games/create/playerDropdown.dart';

class ChoosePlayer extends StatelessWidget {
  ChoosePlayer({@required this.onSelect});

  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 92,
        child: Column(children: [
          Center(
              child: Container(
            width: 320,
            padding: const EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("hello"),
                  // PlayerDropdown(onSelect: onSelect)
                ]),
          )),
          Divider(
            color: Colors.grey,
            thickness: 1,
          )
        ]));
  }
}
