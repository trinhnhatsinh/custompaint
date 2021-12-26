import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class AmountTopping extends StatefulWidget {
  AmountTopping({this.choose});
  final Function choose;

  @override
  _AmountToppingState createState() => _AmountToppingState();
}

class _AmountToppingState extends State<AmountTopping>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  StreamController transController = new StreamController<Offset>.broadcast();
  StreamController angleController = new StreamController<double>.broadcast();
  Stream get transStream => transController.stream;
  Stream get angleStream => angleController.stream;

  Offset preTrans = Offset(0, -16.0);
  double preAngle = 1.0;

  void changeSlider(Offset val) {
    var screen = MediaQuery.of(context).size.width;

    var degee = (val.dx - (screen - 220) / 2) / 110;

    var temp = degee > 1
        ? math.cos(math.pi * (2 - degee) / 7)
        : math.cos(math.pi * degee / 7);

    if (degee >= 0 && degee <= 2) {
      preTrans = Offset(val.dx - screen / 2, -16.0 + (temp - 0.88) * 50);
      transController.sink.add(preTrans);
    }
  }

  void changeAngle(Offset val) {
    var screen = MediaQuery.of(context).size.width;
    var degee = (val.dx - (screen - 220) / 2) / 110;
    if (degee >= 0 && degee <= 2) {
      preAngle = degee;
      angleController.sink.add(preAngle);
    }
  }

  void handleChoose() {
    double amount = preAngle * 6 + 4;
    widget.choose(amount.round());
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: CustomPaint(
                      painter:
                          ChoosedAmount(color: Color(0xFFF1F1F1), angle: 2)))),
          Positioned(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: StreamBuilder(
                      stream: angleStream,
                      builder: (context, snapshot) {
                        return CustomPaint(
                            painter: ChoosedAmount(
                                color: Colors.redAccent,
                                angle: snapshot.hasData
                                    ? snapshot.data
                                    : preAngle));
                      }))),
          Positioned(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox.expand(
                      child: GestureDetector(
                          onPanStart: (detail) {},
                          onPanUpdate: (detail) {
                            RenderBox box = context.findRenderObject();
                            Offset local =
                                box.globalToLocal(detail.globalPosition);

                            changeSlider(local);
                            changeAngle(local);
                          },
                          onPanEnd: (detail) {
                            handleChoose();
                          },
                          child: StreamBuilder(
                              stream: transStream,
                              builder: (context, snapshot) {
                                return Transform.translate(
                                  offset: snapshot.hasData
                                      ? snapshot.data
                                      : preTrans,
                                  child: Image(
                                    image: AssetImage('assets/slider.png'),
                                    height: 32,
                                    width: 32,
                                  ),
                                );
                              })))))
        ],
      ),
    );
    ;
  }
}

class ChoosedAmount extends CustomPainter {
  ChoosedAmount({this.angle, this.color});

  final Color color;
  final double angle;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final rect = Rect.fromLTRB(-200, 0, 200, 160);
    final startAngle = -math.pi * 4 / 6;
    final sweepAngle = math.pi * angle / 6;
    final useCenter = false;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
