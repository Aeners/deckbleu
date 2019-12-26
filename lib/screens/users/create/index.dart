import 'package:flutter/material.dart';

import 'package:app/screens/users/create/form.dart';
import 'package:app/utils/db.dart';

class CreatePlayerScreen extends StatefulWidget {
  static const routeName = '/users/create';

  @override
  _CreatePlayerScreenState createState() => _CreatePlayerScreenState();
}

class _CreatePlayerScreenState extends State<CreatePlayerScreen> {
  _handlePlayerCreate(String username, BuildContext context) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    await helper.insert(username);
    Navigator.pop(context, () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text(
          "Creation d'un mec claqué",
        )),
        body: Container(
            padding: const EdgeInsets.all(30.0),
            child: FormPlayer(
              handleSubmit: (username) =>
                  _handlePlayerCreate(username, context),
            )),
      );
}
