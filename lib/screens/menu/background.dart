import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

const List<String> assetNames = [
  "assets/images/casse_fiole.jpg",
  "assets/images/edgar_markov_mosaic.jpg",
  "assets/images/hapatra.jpg",
  "assets/images/krenko_mosaic.jpg",
  "assets/images/sidisi.jpg",
  "assets/images/teferi.jpg",
];
int getRandomIndex() => Random().nextInt(assetNames.length);

class ImageIndexes {
  int current;
  int next;

  ImageIndexes() {
    this.current = getRandomIndex();
    do {
      this.next = getRandomIndex();
    } while (this.current == this.next);
  }

  nextImage(int newImg) {
    this.current = this.next;
    this.next = newImg;
  }
}

class BackgroundImage extends StatefulWidget {
  BackgroundImage({@required this.handleOnTap});

  final Function handleOnTap;

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  ImageIndexes imgIndexWithNext = new ImageIndexes();
  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(new Duration(seconds: 30), (timer) {
      _setRandomImage();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _setRandomImage([bool isFirst = false]) {
    int assetIndex;
    setState(() {
      do {
        assetIndex = getRandomIndex();
      } while (assetIndex == imgIndexWithNext.current);
      imgIndexWithNext.nextImage(assetIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.handleOnTap,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(assetNames[imgIndexWithNext.current]),
                    fit: BoxFit.fill))));
  }
}
