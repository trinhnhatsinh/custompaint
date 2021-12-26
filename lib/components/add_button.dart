import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  AddButton({this.handle});
  final Function handle;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.redAccent, // button color
        child: InkWell(
          splashColor: Colors.red[200], // inkwell color
          child: SizedBox(
              width: 52,
              height: 52,
              child: Center(
                  child: Icon(
                Icons.add,
                color: Colors.white,
                size: 32,
              ))),
          onTap: () {
            handle();
          },
        ),
      ),
    );
  }
}
