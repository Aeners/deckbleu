import 'package:flutter/material.dart';

class OptionsEntry extends StatelessWidget {
  OptionsEntry({@required this.value, @required this.pathToNavigate});

  final String value;
  final String pathToNavigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            margin: const EdgeInsets.all(25.0),
            child: Text(
              "$value",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontFamily: 'Magic',
                  fontWeight: FontWeight.w500),
            )),
        onTap: () {
          Navigator.pushNamed(context, pathToNavigate);
        });
  }
}
