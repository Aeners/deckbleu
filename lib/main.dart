import 'package:flutter/material.dart';

void main() => runApp(HelloWorld());

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]))
            ],
          )),
          Column(
            children: <Widget>[Icon(Icons.star, color: Colors.red[500])],
          ),
          Column(
            children: <Widget>[Text('41', style: TextStyle(fontSize: 20.0))],
          )
        ]));
    return MaterialApp(
        title: 'deckbleu',
        home: Scaffold(
          appBar: AppBar(title: Text('Welcome to deckbleu app')),
          body: Column(children: [titleSection]),
        ));
  }
}
