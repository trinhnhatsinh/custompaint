import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  Box({this.buy});
  final Stream buy;
  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> handleScale(double val) {
    _controller.forward(from: 0);
    return Tween(begin: val, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Center(
      child: StreamBuilder(
          stream: widget.buy,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ScaleTransition(
                    scale:
                        snapshot.hasData ? handleScale(3.0) : handleScale(1.0),
                    child: Image(
                      image: AssetImage('assets/box.png'),
                      width: 300,
                    ))
                : SizedBox();
          }),
    ));
  }
}
