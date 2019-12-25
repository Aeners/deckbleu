import 'package:flutter/material.dart';

import 'package:app/screens/users/create/form.dart';

class CreatePlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text(
          "Creation d'un mec claqué",
        )),
        body:
            Container(padding: const EdgeInsets.all(10.0), child: FormPlayer()),
      );
}
