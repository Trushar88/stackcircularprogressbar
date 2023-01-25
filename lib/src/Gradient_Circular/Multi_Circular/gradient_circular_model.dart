import 'package:flutter/material.dart';

class GradientBarValue {
  late List<Color> barColores;
  late double barValues;
  late Color fullProgressColors;

  GradientBarValue(
      {required this.barColores,
      required this.barValues,
      required this.fullProgressColors});
}
