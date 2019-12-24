import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

const List<String> assetNames = [
  "images/casse_fiole.jpg",
  "images/edgar_markov_mosaic.jpg",
  "images/hapatra.jpg",
  "images/krenko_mosaic.jpg",
  "images/sidisi.jpg",
  "images/teferi.jpg",
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
  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  ImageIndexes imgIndexWithNext = new ImageIndexes();

  @override
  void initState() {
    Timer.periodic(new Duration(seconds: 30), (timer) {
      _setRandomImage();
    });
    super.initState();
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
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(assetNames[imgIndexWithNext.current]),
                fit: BoxFit.fill)));
  }
}
