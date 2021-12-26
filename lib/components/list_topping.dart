import 'package:flutter/material.dart';
import 'package:lesson3/interfaces/topping.dart';
import 'dart:math' as math;

class ListTopping extends StatefulWidget {
  ListTopping({this.chooseTopping});

  final Function chooseTopping;

  @override
  _ListSizeState createState() => _ListSizeState();
}

class _ListSizeState extends State<ListTopping>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  final _radius = 274.0;

  var oldIndex = 0;
  var angle = 0 * math.pi / 14;

  final List<Topping> toppings = [
    new Topping(
        key: 'BEEF',
        amount: 0.0,
        urlImage: 'assets/toppings/topping-beef.png',
        backgroundColor: Color.fromRGBO(210, 83, 65, 0.2)),
    new Topping(
        key: 'BERRY',
        amount: 0.0,
        urlImage: 'assets/toppings/topping-kiwi.png',
        backgroundColor: Color.fromRGBO(108, 99, 181, 0.2)),
    new Topping(
        key: 'CAPSICUM',
        amount: 0.0,
        urlImage: 'assets/toppings/topping-orange.png',
        backgroundColor: Color.fromRGBO(255, 212, 0, 0.2)),
    new Topping(
        key: 'PEAR',
        amount: 0.0,
        urlImage: 'assets/toppings/topping-pear.png',
        backgroundColor: Color.fromRGBO(170, 220, 68, 0.2)),
    new Topping(
        key: 'TOMATO',
        amount: 0.0,
        urlImage: 'assets/toppings/topping-tomato.png',
        backgroundColor: Color.fromRGBO(244, 59, 59, 0.2))
  ];

  void handleChangeTopping(String key, int index) {
    _animation = Tween(begin: oldIndex * 12.8 / 360, end: index * 12.8 / 360)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
          ..addListener(() {
            this.setState(() {});
          });

    _controller.forward(from: 0);
    this.setState(() {
      oldIndex = index;
      angle = index * math.pi / 14;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: _animation,
        child: SizedBox.expand(
            child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 17 / 14),
                      _radius * math.sin(math.pi * 17 / 14)),
                  child: Center(
                      child: Transform.rotate(
                          angle: -angle,
                          child: ClipOval(
                          child: Material(
                            color: toppings[0].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[0].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[0].key, 4);
                                widget.chooseTopping(toppings[0].urlImage);
                              },
                            ),
                          ),
                        )))),
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 18 / 14),
                      _radius * math.sin(math.pi * 18 / 14)),
                  child: Center(
                    child: Transform.rotate(
                        angle: -angle,
                        child: ClipOval(
                          child: Material(
                            color: toppings[1].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[1].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[1].key, 3);
                                widget.chooseTopping(toppings[1].urlImage);
                              },
                            ),
                          ),
                        )),
                  )),
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 19 / 14),
                      _radius * math.sin(math.pi * 19 / 14)),
                  child: Center(
                    child: Transform.rotate(
                        angle: -angle,
                        child: ClipOval(
                          child: Material(
                            color: toppings[2].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[2].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[2].key, 2);
                                widget.chooseTopping(toppings[2].urlImage);
                              },
                            ),
                          ),
                        )),
                  )),
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 20 / 14),
                      _radius * math.sin(math.pi * 20 / 14)),
                  child: Center(
                    child: Transform.rotate(
                        angle: -angle,
                        child: ClipOval(
                          child: Material(
                            color: toppings[3].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[3].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[3].key, 1);
                                widget.chooseTopping(toppings[3].urlImage);
                              },
                            ),
                          ),
                        )),
                  )),
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 21 / 14),
                      _radius * math.sin(math.pi * 21 / 14)),
                  child: Center(
                    child: Transform.rotate(
                        angle: -angle,
                        child: ClipOval(
                          child: Material(
                            color: toppings[4].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[4].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[4].key, 0);
                                widget.chooseTopping(toppings[4].urlImage);
                              },
                            ),
                          ),
                        )),
                  )),
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 22 / 14),
                      _radius * math.sin(math.pi * 22 / 14)),
                  child: Center(
                    child: Transform.rotate(
                        angle: -angle,
                        child: ClipOval(
                          child: Material(
                            color: toppings[0].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[0].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[0].key, -1);
                                widget.chooseTopping(toppings[0].urlImage);
                              },
                            ),
                          ),
                        )),
                  )),
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 23 / 14),
                      _radius * math.sin(math.pi * 23 / 14)),
                  child: Center(
                    child: Transform.rotate(
                        angle: -angle,
                        child: ClipOval(
                          child: Material(
                            color: toppings[1].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[1].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[1].key, -2);
                                widget.chooseTopping(toppings[1].urlImage);
                              },
                            ),
                          ),
                        )),
                  )),
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 24 / 14),
                      _radius * math.sin(math.pi * 24 / 14)),
                  child: Center(
                    child: Transform.rotate(
                        angle: -angle,
                        child: ClipOval(
                          child: Material(
                            color: toppings[2].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[2].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[2].key, -3);
                                widget.chooseTopping(toppings[2].urlImage);
                              },
                            ),
                          ),
                        )),
                  )),
              Transform.translate(
                  offset: Offset(_radius * math.cos(math.pi * 25 / 14),
                      _radius * math.sin(math.pi * 25 / 14)),
                  child: Center(
                    child: Transform.rotate(
                        angle: -angle,
                        child: ClipOval(
                          child: Material(
                            color: toppings[3].backgroundColor, // button color
                            child: InkWell(
                              splashColor: Color.fromRGBO(255, 255, 255, 0.2), // inkwell color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Center(
                                      child: Image(
                                          width: 14,
                                          height: 14,
                                          image: AssetImage(
                                              toppings[3].urlImage)))),
                              onTap: () {
                                handleChangeTopping(toppings[3].key, -4);
                                widget.chooseTopping(toppings[3].urlImage);
                              },
                            ),
                          ),
                        )),
                  )),
            ],
          ),
        )));
  }
}
