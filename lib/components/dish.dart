import 'package:flutter/material.dart';
import 'dart:math' as math;

class Dish extends StatefulWidget {
  Dish({this.topping, this.key, this.preTopping, this.preAmount});

  final Stream topping;
  final String preTopping;
  final int preAmount;
  final Key key;

  @override
  _DishState createState() => _DishState(key: key);
}

class _DishState extends State<Dish> with SingleTickerProviderStateMixin {
  _DishState({this.key});
  final Key key;

  AnimationController _controller;

  Animation<double> handleScale(double val) {
    _controller.forward(from: 0);
    return Tween(begin: val, end: 1.0).animate(_controller);
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Align(
            alignment: Alignment.center,
            child: StreamBuilder(
                stream: widget.topping,
                builder: (context, snapshot) {
                  int angle = snapshot.hasData
                      ? (snapshot.data[1] / 2).round()
                      : (widget.preAmount / 2).round();

                  return ScaleTransition(
                      scale: snapshot.hasData
                          ? handleScale(8.0)
                          : handleScale(1.0),
                      child: Container(
                          width: 150,
                          height: 150,
                          child: Center(
                              child: Stack(
                                  children: List<Widget>.generate(
                            snapshot.hasData
                                ? snapshot.data[1]
                                : widget.preAmount,
                            (index) => Transform.translate(
                                offset: Offset(
                                    (math.Random().nextInt(40) + 30) *
                                        math.cos(math.pi * index / angle),
                                    (math.Random().nextInt(40) + 30) *
                                        math.sin(math.pi * index / angle)),
                                child: Transform.rotate(
                                    angle: (math.Random().nextInt(2) + -1) *
                                        math.pi /
                                        (math.Random().nextInt(12) + 0),
                                    child: Image(
                                        width: 18,
                                        height: 18,
                                        image: AssetImage(snapshot.hasData
                                            ? snapshot.data[0]
                                            : widget.preTopping)))),
                          )))));
                })));
  }
}
