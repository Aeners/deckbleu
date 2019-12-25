import 'package:flutter/material.dart';
import 'package:app/screens/menu/options/entry.dart';

class MenuOptions extends StatelessWidget {
  MenuOptions({@required this.canPlay});

  final bool canPlay;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Center(
            child: Container(
                color: Color.fromRGBO(0, 0, 0, 0.62),
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OptionsEntry(
                        pathToNavigate: '/users/create',
                        value: "Creer un joueur"),
                    OptionsEntry(
                        pathToNavigate: '/game',
                        value: "Lancer une partie",
                        disabled: !canPlay),
                    OptionsEntry(
                      pathToNavigate: '/settings',
                      value: "Parametres",
                    )
                  ],
                )))));
  }
}
