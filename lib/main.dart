import 'package:flutter/material.dart';

void main() => runApp(HelloWorld());

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'LOCATION'),
          _buildButtonColumn(color, Icons.share, 'SHARE')
        ],
      )
    );

    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]))
            ],
          )),
          FavoriteWidget()
        ]));
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
        title: 'deckbleu',
        home: Scaffold(
          appBar: AppBar(title: Text('Deckbleu')),
          body: ListView(
            children: [
              Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover
              ),
              titleSection,
              buttonSection,
              textSection
            ]
          ),
        ));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color)),
      )
    ]);
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();

}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 41;

  _toggleFavorited() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount--;
      } else {
        _isFavorited = true;
        _favoriteCount++;
      } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
          color: Colors.red[500],
          onPressed: _toggleFavorited
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          )
        )
      ],
    );
  }
}
