import 'package:flutter/material.dart';

class GardientBarValue {
  late List<Color> barColores;
  late double barValues;
  late Color fullProgressColors;

  GardientBarValue(
      {required this.barColores,
      required this.barValues,
      required this.fullProgressColors});
}
