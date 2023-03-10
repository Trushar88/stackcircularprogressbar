// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

const double doublePi = 2 * pi;

const double piDiv180 = pi / 180;

double degToRad(double degree) {
  return degree * piDiv180;
}

// getStrokeSpace count the space between two bars
double getStrokeSpace(index, strokWidth, strokSpace) =>
    ((strokWidth + strokSpace) * index);

// getStrokeValue function return the bar value
double getStrokeValue(double value) => value / 100;

//Sample bar colors
class BarColor {
  static const black = Colors.black;
  static const blue = Colors.blue;
  static const green = Colors.green;
  static const purple = Colors.purple;
  static const red = Colors.red;
  static const white = Colors.white;
  static const yellow = Colors.yellow;
}
