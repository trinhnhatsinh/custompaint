import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lesson3/components/choose_size.dart';
import 'package:lesson3/components/choose_topping.dart';
import 'package:lesson3/components/preview_dish.dart';
import 'package:lesson3/components/choose_amount_toppin.dart';
import 'package:lesson3/components/add_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  StreamController counterController = new StreamController<String>.broadcast();
  StreamController buyController = new StreamController<bool>.broadcast();
  StreamController sizeController =
      new StreamController<List>.broadcast();

  StreamController amountController = new StreamController<List>.broadcast();

  Stream get counterStream => counterController.stream;
  Stream get sizeStream => sizeController.stream;
  Stream get buyStream => buyController.stream;
  Stream get amountStream => amountController.stream;

  List size = ['M', 'M'];
  String topping = 'assets/toppings/topping-tomato.png';
  int amount = 6;

  void chooseSize(String newSize) {
    if (size[1] != newSize) {
      size = [size[1], newSize, topping, amount];
      sizeController.sink.add(size);
    }
  }

  void buy() {
    buyController.sink.add(true);
  }

  void chooseTopping(String newTopping) {
    if (topping != newTopping) {
      topping = newTopping;
    }
  }

  void chooseAmount(int newAmount) {
    amount = newAmount;
    amountController.sink.add([topping, newAmount]);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    counterController.close();
    sizeController.close();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          PreviewDish(
            buy: buyStream,
            size: sizeStream,
            topping: amountStream,
            key: UniqueKey(),
          ),
          Positioned(
            top: 560,
            left: (MediaQuery.of(context).size.width - 600 * 1.7) / 2,
            right: (MediaQuery.of(context).size.width - 600 * 1.7) / 2,
            child: ChooseSize(
              chooseSize: chooseSize,
            ),
          ),
          Positioned(
            top: 560.0 + 80.0,
            left: (MediaQuery.of(context).size.width - 600 * 1.7) / 2,
            right: (MediaQuery.of(context).size.width - 600 * 1.7) / 2,
            child: ChooseToppin(chooseTopping: chooseTopping),
          ),
          Positioned(
              top: 560,
              left: 0,
              right: 0,
              child: AmountTopping(
                choose: chooseAmount,
              )
              // child: AmountTopping(),
              ),
          Positioned(
              top: 620,
              left: (MediaQuery.of(context).size.width - 52) / 2,
              right: (MediaQuery.of(context).size.width - 52) / 2,
              child: AddButton(
                handle: buy,
              )
              // child: AmountTopping(),
              )
        ]),
      ),
    ));
  }
}
