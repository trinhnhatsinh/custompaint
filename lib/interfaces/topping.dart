import 'dart:ffi';

import 'dart:ui';

class Topping {
  Topping({this.key, this.urlImage, this.amount, this.backgroundColor});

  String key;
  String urlImage;
  Color backgroundColor;
  double amount;
}
