import 'package:flutter/material.dart';
import 'dart:math';

const List<String> possibleSubmitValues = [
  "Sérieux ?",
  "Pire pseudo",
  "Réfléchi mieux stp",
  "Stop le sel"
];
int getRandomIndex() => Random().nextInt(possibleSubmitValues.length);

class FormPlayer extends StatefulWidget {
  FormPlayer({Key key, @required this.handleSubmit}) : super(key: key);

  final Function handleSubmit;

  @override
  _FormPlayerState createState() => _FormPlayerState();
}

class _FormPlayerState extends State<FormPlayer>
    with SingleTickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double _opacity = 0.0;
  String _submitValue = '';
  bool _submitCanChange = true;
  Animation<Offset> _offsetAnimation;
  AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-0.5, 0.0),
      end: const Offset(0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _handleTextChange(text) {
    setState(() {
      if (text.isEmpty) {
        _opacity = 0;
        _submitCanChange = true;
      } else {
        _opacity = 1;
        if (_submitCanChange) {
          int newIndex;
          do {
            newIndex = getRandomIndex();
          } while (possibleSubmitValues[newIndex] == _submitValue);
          _submitValue = possibleSubmitValues[newIndex];
          _submitCanChange = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            onChanged: _handleTextChange,
            style: TextStyle(
                fontSize: 25.0, color: Theme.of(context).primaryColor),
            decoration: const InputDecoration(
              hintText: 'Envoie le blase petit',
              labelText: 'Nom du joueur',
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
            child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInQuad,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        color: Theme.of(context).bottomAppBarColor,
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            widget.handleSubmit(usernameController.text);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Text("$_submitValue"),
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: Text(">>"),
                            ),
                          ],
                        ),
                      ),
                    ])),
          ),
        ],
      ));
}
