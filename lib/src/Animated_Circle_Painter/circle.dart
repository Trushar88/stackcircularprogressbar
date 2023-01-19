import 'dart:math';

import 'package:flutter/material.dart';

class Circle extends CustomPainter {
  final Color color;
  final Color sliderColor;
  final Color unSelectedColor;
  final double angle;
  final double stockWidth;
  final double barWidth;
  Circle(
      {required this.angle,
      required this.color,
      required this.sliderColor,
      required this.unSelectedColor,
      required this.stockWidth,
      required this.barWidth});
  @override
  void paint(Canvas canvas, Size size) {
    var center = const Offset(0, 0);
    canvas.translate(size.width / 2, size.height / 2);
    var radius = size.width;
    var circleBrush = Paint()..color = color;

    var unSelectedAreaBrush = Paint()..color = unSelectedColor;
    var sliderBrush = Paint()
      ..color = sliderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = stockWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, 10, circleBrush);
    canvas.drawCircle(center, radius - (20 - barWidth), unSelectedAreaBrush);
    canvas.drawArc(
        Rect.fromCircle(center: const Offset(0, 0), radius: radius - 32),
        0, //radians
        -angle * pi / 180, //radians
        false,
        sliderBrush);
    canvas.drawCircle(center, radius - (barWidth + 45), circleBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
