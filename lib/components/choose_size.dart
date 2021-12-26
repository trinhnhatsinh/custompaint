import 'package:flutter/material.dart';
import 'package:lesson3/components/list_size.dart';
import 'dart:math' as math;

class ChooseSize extends StatefulWidget {
  ChooseSize({this.chooseSize});

  final Function chooseSize;

  @override
  _ChooseSizeState createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
          fit: StackFit.expand,
          children: [
            Positioned(
                child: Align(
                    alignment: Alignment.center,
                    child: ListSize(
                      chooseSize: widget.chooseSize,
                    ))),
            Positioned(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: CustomPaint(painter: ChoosedItem()))),
          ],
        ),
      ),
    );
  }
}

class ChoosedItem extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final rect = Rect.fromLTRB(-50, 0, 50, 25);
    final startAngle = -math.pi * 4 / 6;
    final sweepAngle = math.pi * 2 / 6;
    final useCenter = false;
    final paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
