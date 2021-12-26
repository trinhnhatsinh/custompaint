import 'package:flutter/material.dart';
import 'package:lesson3/components/list_topping.dart';

class ChooseToppin extends StatelessWidget {
  ChooseToppin({this.chooseTopping});

  final Function chooseTopping;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Transform.scale(
      scale: 1.7,
      child: Container(
        width: 600,
        height: 600,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 3, color: Color(0xFFF3F1F3), spreadRadius: 2)
            ]),
        child: Stack(
          children: [
            Positioned(
                child:
                    Align(alignment: Alignment.center, child: ListTopping(chooseTopping: chooseTopping))),
            Positioned(
                left: 0,
                top: 46,
                right: 0,
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.redAccent, shape: BoxShape.circle),
                ))
          ],
        ),
      ),
    );
  }
}
