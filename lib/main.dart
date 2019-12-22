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
              // textSection,
              ShapeShifterContainer()
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

class ShapeShifterContainer extends StatefulWidget {
  @override
  _ShapeShifterContainerState createState() => _ShapeShifterContainerState();
}


class _ShapeShifterContainerState extends State<ShapeShifterContainer> {
  bool _isDefault = true;

  void _handleShift() {
      setState(() {
        _isDefault = !_isDefault;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Shape(isDefault: _isDefault),
          Shifter(handleShift: _handleShift)
        ]
      )
    );
  }
}

class Shape extends StatefulWidget {
  Shape({@required this.isDefault});

  final bool isDefault;

  @override
  _ShapeState createState() => _ShapeState();
}

class _ShapeState extends State<Shape> {
  Color _blue = Colors.blue[300];
  Color _red = Colors.red[300];
  Radius _squareRadius = Radius.zero;
  Radius _circleRadius = Radius.circular(50);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInExpo,
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: widget.isDefault ? _red : _blue,
          borderRadius: BorderRadius.all(
            widget.isDefault ? _squareRadius : _circleRadius
          ), 
        ),
    );
  }
}

class Shifter extends StatelessWidget {
  Shifter({Key key, @required this.handleShift})
      : super(key: key);

  final Function handleShift;

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.pie_chart), color: Colors.blue[300], onPressed: handleShift);
  }
}