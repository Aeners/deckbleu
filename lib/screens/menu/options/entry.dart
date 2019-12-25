import 'package:flutter/material.dart';

class OptionsEntry extends StatelessWidget {
  OptionsEntry(
      {Key key,
      @required this.value,
      @required this.pathToNavigate,
      this.disabled = false})
      : super(key: key);

  final String value;
  final String pathToNavigate;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            margin: const EdgeInsets.all(25.0),
            child: Text(
              "$value",
              style: TextStyle(
                  color: disabled ? Colors.grey : Colors.white,
                  fontSize: 40.0,
                  fontFamily: 'Magic',
                  fontWeight: FontWeight.w500),
            )),
        onTap: disabled
            ? null
            : () {
                Navigator.pushNamed(context, pathToNavigate);
              });
  }
}
