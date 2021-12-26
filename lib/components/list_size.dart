import 'package:flutter/material.dart';
import 'dart:math' as math;

class ListSize extends StatefulWidget {
  ListSize({this.chooseSize});

  final Function chooseSize;

  @override
  _ListSizeState createState() => _ListSizeState();
}

class _ListSizeState extends State<ListSize>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  final _radius = 280.0;

  var activeSize = 'M';
  var oldIndex = 0;
  var angle = 0 * math.pi / 14;

  void handleChangeSize(String size, int index) {
    widget.chooseSize(size);

    _animation = Tween(begin: oldIndex * 12.8 / 360, end: index * 12.8 / 360)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
          ..addListener(() {
            this.setState(() {});
          });

    _controller.forward(from: 0);
    this.setState(() {
      activeSize = size;
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
                  child: Container(
                      child: Center(
                          child: Transform.rotate(
                              angle: -angle,
                              child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'L',
                                        style: TextStyle(
                                            color: activeSize == 'L'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('L', 4);
                                  },
                                ),
                              ),
                            ))))),
              Transform.translate(
                offset: Offset(_radius * math.cos(math.pi * 18 / 14),
                    _radius * math.sin(math.pi * 18 / 14)),
                child: Container(
                    child: Center(
                        child: Transform.rotate(
                            angle: -angle,
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'M',
                                        style: TextStyle(
                                            color: activeSize == 'M'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('M', 3);
                                  },
                                ),
                              ),
                            )))),
              ),
              Transform.translate(
                offset: Offset(_radius * math.cos(math.pi * 19 / 14),
                    _radius * math.sin(math.pi * 19 / 14)),
                child: Container(
                    child: Center(
                        child: Transform.rotate(
                            angle: -angle,
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'S',
                                        style: TextStyle(
                                            color: activeSize == 'S'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('S', 2);
                                  },
                                ),
                              ),
                            )))),
              ),
              Transform.translate(
                offset: Offset(_radius * math.cos(math.pi * 20 / 14),
                    _radius * math.sin(math.pi * 20 / 14)),
                child: Container(
                    child: Center(
                        child: Transform.rotate(
                            angle: -angle,
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'L',
                                        style: TextStyle(
                                            color: activeSize == 'L'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('L', 1);
                                  },
                                ),
                              ),
                            )))),
              ),
              Transform.translate(
                offset: Offset(_radius * math.cos(math.pi * 21 / 14),
                    _radius * math.sin(math.pi * 21 / 14)),
                child: Container(
                    child: Center(
                        child: Transform.rotate(
                            angle: -angle,
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'M',
                                        style: TextStyle(
                                            color: activeSize == 'M'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('M', 0);
                                  },
                                ),
                              ),
                            )))),
              ),
              Transform.translate(
                offset: Offset(_radius * math.cos(math.pi * 22 / 14),
                    _radius * math.sin(math.pi * 22 / 14)),
                child: Container(
                    child: Center(
                        child: Transform.rotate(
                            angle: -angle,
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'S',
                                        style: TextStyle(
                                            color: activeSize == 'S'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('S', -1);
                                  },
                                ),
                              ),
                            )))),
              ),
              Transform.translate(
                offset: Offset(_radius * math.cos(math.pi * 23 / 14),
                    _radius * math.sin(math.pi * 23 / 14)),
                child: Container(
                    child: Center(
                        child: Transform.rotate(
                            angle: -angle,
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'L',
                                        style: TextStyle(
                                            color: activeSize == 'L'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('L', -2);
                                  },
                                ),
                              ),
                            )))),
              ),
              Transform.translate(
                offset: Offset(_radius * math.cos(math.pi * 24 / 14),
                    _radius * math.sin(math.pi * 24 / 14)),
                child: Container(
                    child: Center(
                        child: Transform.rotate(
                            angle: -angle,
                            child:ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'M',
                                        style: TextStyle(
                                            color: activeSize == 'M'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('M', -3);
                                  },
                                ),
                              ),
                            )))),
              ),
              Transform.translate(
                offset: Offset(_radius * math.cos(math.pi * 25 / 14),
                    _radius * math.sin(math.pi * 25 / 14)),
                child: Container(
                    child: Center(
                        child: Transform.rotate(
                            angle: -angle,
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.grey[100], // inkwell color
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Center(
                                          child: Text(
                                        'S',
                                        style: TextStyle(
                                            color: activeSize == 'S'
                                                ? Colors.redAccent
                                                : Colors.grey[500]),
                                      ))),
                                  onTap: () {
                                    handleChangeSize('S', -4);
                                  },
                                ),
                              ),
                            )))),
              ),
            ],
          ),
        )));
  }
}
