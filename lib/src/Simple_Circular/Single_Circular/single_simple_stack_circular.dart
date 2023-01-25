// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:circular_progress_stack/src/Simple_Circular/simple_circular_paint.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class SingleSimpleStackCircularProgressBar extends StatefulWidget {
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

  /// Foreground bar color
  final Color barColor;

  /// Progress value
  final double barValue;

  /// middel text show hide
  final bool isTextShow;

  /// Background circle line thickness.
  final double backStrokeWidth;

  /// Backgound color
  final Color backColor;

  ///TextStyle of middle text
  final TextStyle textStyle;

  const SingleSimpleStackCircularProgressBar({
    Key? key,
    this.size = 100,
    this.startAngle = 0,
    this.maxValue = 100,
    this.isTextShow = true,
    this.progressStrokeWidth = 15,
    this.strokeSpacePadding = 10,
    this.backStrokeWidth = 15,
    required this.barColor,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 20),
    required this.barValue,
    this.backColor = const Color(0xFF16262D),
  }) : super(key: key);

  @override
  _SimpleNewStackCircularProgressBarState createState() =>
      _SimpleNewStackCircularProgressBarState();
}

class _SimpleNewStackCircularProgressBarState
    extends State<SingleSimpleStackCircularProgressBar> {
  final double minSweepAngle = 0.015;
  late double circleLength;
  late double widgetSize;
  late double startAngle;
  late double correctAngle;

  /// root of widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.size, height: widget.size, child: _circular());
  }

  //update widget
  @override
  void didUpdateWidget(
      covariant SingleSimpleStackCircularProgressBar oldWidget) {
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
  Widget _circular() {
    final reducedValue = widget.barValue / widget.maxValue;
    final currentLength = reducedValue * circleLength;
    final sweepAngle = (doublePi * reducedValue) - correctAngle;

    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: degToRad(widget.startAngle - 90),
          child: CustomPaint(
            size: Size(widgetSize, widgetSize),
            painter: SimpleNewCircularProgressBarPainter(
              progressStrokeWidth: widget.progressStrokeWidth,
              backStrokeWidth: widget.backStrokeWidth,
              startAngle: 0,
              sweepAngle: sweepAngle,
              currentLength: currentLength,
              color: widget.barColor,
              backColor: widget.backColor,
              fullProgressColor: widget.barColor,
              isFullProgress: false,
            ),
          ),
        ),
        widget.isTextShow
            ? Text(
                widget.barValue.toString().split(".")[0],
                style:
                    widget.textStyle.copyWith(overflow: TextOverflow.ellipsis),
              )
            : const SizedBox()
      ],
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
