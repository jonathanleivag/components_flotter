import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerView extends StatefulWidget {
  const AnimatedContainerView({Key? key}) : super(key: key);

  @override
  _AnimatedContainerViewState createState() => _AnimatedContainerViewState();
}

class _AnimatedContainerViewState extends State<AnimatedContainerView> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: _width,
        height: _height,
        decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _changeValue(),
          child: const Icon(Icons.play_arrow, size: 35.0)),
    );
  }

  void _changeValue() {
    final randomWidth = Random().nextInt(350).toDouble();
    final randomHeight = Random().nextInt(350).toDouble();
    final randomRed = Random().nextInt(255);
    final randomGreen = Random().nextInt(255);
    final randomBlue = Random().nextInt(255);
    final randomRadius = Random().nextInt(100).toDouble();

    setState(() {
      _width = randomWidth;
      _height = randomHeight;
      _color = Color.fromRGBO(randomRed, randomGreen, randomBlue, 1);
      _borderRadius = BorderRadius.circular(randomRadius);
    });
  }
}
