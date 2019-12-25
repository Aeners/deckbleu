import 'package:flutter/material.dart';

class FormPlayer extends StatefulWidget {
  FormPlayer({Key key}) : super(key: key);

  @override
  _FormPlayerState createState() => _FormPlayerState();
}

class _FormPlayerState extends State<FormPlayer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            style: TextStyle(
                fontSize: 25.0, color: Theme.of(context).primaryColor),
            decoration: const InputDecoration(
              hintText: 'Envoie le blase petit',
              labelText: 'Pseudo du joueur',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Fais pas le malin ...';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  print('hello');
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ));
}

/**
 * decoration: new InputDecoration(
      labelText: "Hello",
      labelStyle: theme.textTheme.caption.copyWith(color: theme.primaryColor),
    ),
 */
