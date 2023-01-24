// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:circular_progress_stack/src/Gardient_Circular/gradient_circular_utils.dart';
import 'package:circular_progress_stack/src/Simaple_New_Circular/simple_new_circular_model.dart';
import 'package:circular_progress_stack/src/Simaple_New_Circular/simple_new_circular_paint.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class SimpleNewStackCircularProgressBar extends StatefulWidget {
  /// Size of circle
  final double size;

  /// start circle progress point
  final double startAngle;

  /// max progress value
  final double maxValue;

  /// Progress line thickness.
  final double progressStrokeWidth;

  /// padding between  bars
  final double strokeSpacePadding;

  /// Background circle line thickness.
  final double backStrokeWidth;

  /// Draw bars using this bars value
  final List<SimpleNewBarValue> bars;

  /// Backgound color
  final Color backColor;

  /// Animate pogress time

  const SimpleNewStackCircularProgressBar({
    Key? key,
    this.size = 100,
    this.startAngle = 0,
    this.maxValue = 100,
    this.progressStrokeWidth = 15,
    this.strokeSpacePadding = 10,
    this.backStrokeWidth = 15,
    required this.bars,
    this.backColor = const Color(0xFF16262D),
  }) : super(key: key);

  @override
  _SimpleNewStackCircularProgressBarState createState() =>
      _SimpleNewStackCircularProgressBarState();
}

class _SimpleNewStackCircularProgressBarState
    extends State<SimpleNewStackCircularProgressBar>
    with TickerProviderStateMixin {
  final double minSweepAngle = 0.015;
  late double circleLength;
  late double widgetSize;
  late double startAngle;
  late double correctAngle;
  late List<ValueNotifier<double>> valueNotifier;
  late List<Animation<int>> animation;

  /// root of widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: _getStackCirculers(
        circles: widget.bars,
      ),
    );
  }

  //update widget
  @override
  void didUpdateWidget(covariant SimpleNewStackCircularProgressBar oldWidget) {
    _initController();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initController();
  }

  //return main circle widget
  Widget _circular(
      int index, Color fullProgressColors, Color frontColor, double value) {
    final reducedValue = value / widget.maxValue;
    final currentLength = reducedValue * circleLength;
    final sweepAngle = (doublePi * reducedValue) - correctAngle;

    return Transform.rotate(
      angle: degToRad(widget.startAngle - 90),
      child: CustomPaint(
        size: Size(widgetSize, widgetSize),
        painter: SimpleNewCircularProgressBarPainter(
          progressStrokeWidth: widget.progressStrokeWidth,
          backStrokeWidth: widget.backStrokeWidth,
          startAngle: 0,
          sweepAngle: sweepAngle,
          currentLength: currentLength,
          color: frontColor,
          backColor: widget.backColor,
          fullProgressColor: fullProgressColors,
          isFullProgress: false,
        ),
      ),
    );
  }

  /// return list of circle based on bars value
  Widget _getStackCirculers({required List<SimpleNewBarValue> circles}) {
    return Stack(
      children: List.generate(circles.length, (index) {
        return Positioned(
            bottom: getStrokeSpace(
                index, widget.progressStrokeWidth, widget.strokeSpacePadding),
            top: getStrokeSpace(
                index, widget.progressStrokeWidth, widget.strokeSpacePadding),
            left: getStrokeSpace(
                index, widget.progressStrokeWidth, widget.strokeSpacePadding),
            right: getStrokeSpace(
                index, widget.progressStrokeWidth, widget.strokeSpacePadding),
            child: _circular(index, circles[index].fullProgressColors,
                circles[index].barColor, circles[index].barValues));
      }),
    );
  }

  /// called it in init
  void _initController() {
    widgetSize = (widget.size <= 0) ? 100.0 : widget.size;
    circleLength = pi * widgetSize;
    final k = doublePi / circleLength;
    correctAngle = widget.progressStrokeWidth * k;
    startAngle = (correctAngle / 2);
  }
}
