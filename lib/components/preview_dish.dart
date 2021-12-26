import 'package:flutter/material.dart';
import 'package:lesson3/components/dish.dart';
import 'package:lesson3/components/box.dart';

class PreviewDish extends StatefulWidget {
  PreviewDish({this.size, this.topping, this.key, this.buy});

  final Stream size;
  final Stream topping;
  final Stream buy;
  final Key key;

  @override
  _PreviewDishState createState() => _PreviewDishState(key: key);
}

class _PreviewDishState extends State<PreviewDish>
    with SingleTickerProviderStateMixin {
  _PreviewDishState({this.key});

  final Key key;

  AnimationController _controller;
  Animation<double> _animationRotate;

  Animation<double> handleScale(String preSize, String size) {
    double beginScale = getIndexScale(preSize);
    double endScale = getIndexScale(size);

    _controller.forward(from: 0);

    return Tween(begin: beginScale, end: endScale).animate(_controller);
  }

  Animation<double> handleRotate() {
    _controller.forward(from: 0);
    return Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  double getIndexScale(String size) {
    switch (size) {
      case 'S':
        return 0.9;
        break;
      case 'M':
        return 1.0;
        break;
      case 'L':
        return 1.2;
        break;
      default:
        return 1.0;
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationRotate = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Center(
            child: Stack(children: [
          Center(
              child: StreamBuilder(
                  stream: widget.size,
                  builder: (context, snapshot) => RotationTransition(
                      turns: handleRotate(),
                      child: ScaleTransition(
                        scale: snapshot.hasData
                            ? handleScale(snapshot.data[0], snapshot.data[1])
                            : handleScale('M', 'M'),
                        child: Stack(children: [
                          Center(
                              child: Image(
                            width: 180,
                            image: AssetImage('assets/pizza.png'),
                          )),
                          Dish(
                            preTopping: snapshot.hasData
                                ? snapshot.data[2]
                                : 'assets/toppings/topping-tomato.png',
                            preAmount: snapshot.hasData ? snapshot.data[3] : 6,
                            topping: widget.topping,
                            key: UniqueKey(),
                          )
                        ]),
                      )))),
          Box(
            buy: widget.buy,
          )
        ])));
  }
}
