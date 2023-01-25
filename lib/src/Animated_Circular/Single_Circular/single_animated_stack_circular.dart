// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:circular_progress_stack/src/Animated_Circular/animated_circular_paint.dart';
import 'package:circular_progress_stack/src/utils.dart';
import 'package:flutter/material.dart';

typedef OnGetCenterText = Text Function(double);

class SingleAnimatedStackCircularProgressBar extends StatefulWidget {
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

  /// Foreground bar color
  final Color barColor;

  /// Progress value
  final double barValue;

  /// Backgound color
  final Color backColor;

  /// middel text show hide
  final bool isTextShow;

  ///TextStyle of middle text
  final TextStyle textStyle;

  /// Animate pogress time
  final Duration animationDuration;

  const SingleAnimatedStackCircularProgressBar({
    Key? key,
    this.size = 100,
    this.startAngle = 0,
    this.maxValue = 100,
    this.isTextShow = true,
    this.progressStrokeWidth = 15,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 20),
    this.strokeSpacePadding = 10,
    this.backStrokeWidth = 15,
    required this.barColor,
    required this.barValue,
    this.backColor = const Color(0xFF16262D),
    this.animationDuration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  _SingleAnimatedStackCircularProgressBarState createState() =>
      _SingleAnimatedStackCircularProgressBarState();
}

class _SingleAnimatedStackCircularProgressBarState
    extends State<SingleAnimatedStackCircularProgressBar>
    with TickerProviderStateMixin {
  final double minSweepAngle = 0.015;
  late double circleLength;
  late double widgetSize;
  late double startAngle;
  late double correctAngle;
  late AnimationController animationController;
  late ValueNotifier<double> valueNotifier;
  late Animation<int> animation;

  /// root of widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: _circular(),
    );
  }

  //update widget
  @override
  void didUpdateWidget(
      covariant SingleAnimatedStackCircularProgressBar oldWidget) {
    _disposeAnim();
    _initController();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _disposeAnim();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initController();
  }

  //return main circle widget
  Widget _circular() {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (BuildContext context, double value, Widget? child) {
        if (value > widget.maxValue) {
          value = widget.maxValue;
        } else if (value < 0) {
          value = 0;
        }
        if (value < animationController.value) {
          animationController.forward();
        } else {
          animationController.animateTo(value);
        }
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, snapshot) {
            if ((value != animationController.upperBound) &&
                (animationController.value >= animationController.upperBound)) {
              animationController.reset();
              animationController.animateTo(value);
            }
            double sweepAngle;
            final reducedValue = animationController.value / widget.maxValue;
            if (animationController.value == 0) {
              sweepAngle = 0;
            } else {
              sweepAngle = (doublePi * reducedValue) - correctAngle;

              if (sweepAngle <= 0) {
                sweepAngle = minSweepAngle;
              }
            }
            final currentLength = reducedValue * circleLength;
            final isFullProgress =
                (animationController.value == animationController.upperBound);

            return Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: degToRad(widget.startAngle - 90),
                  child: CustomPaint(
                    size: Size(widgetSize, widgetSize),
                    painter: AnimatedCircularProgressBarPainter(
                      progressStrokeWidth: widget.progressStrokeWidth,
                      backStrokeWidth: widget.backStrokeWidth,
                      startAngle: startAngle,
                      sweepAngle: sweepAngle,
                      currentLength: currentLength,
                      color: widget.barColor,
                      backColor: widget.backColor,
                      fullProgressColor: widget.barColor,
                      isFullProgress: isFullProgress,
                    ),
                  ),
                ),
                widget.isTextShow
                    ? Text(
                        animationController.value.round().toString(),
                        style: widget.textStyle
                            .copyWith(overflow: TextOverflow.ellipsis),
                      )
                    : const SizedBox()
              ],
            );
          },
        );
      },
    );
  }

  /// dipose animation
  void _disposeAnim() {
    animationController.dispose();
  }

  /// called it in init
  /// initialize animation controller
  /// fill sweep gradinent
  /// initialize valueNotifier
  void _initController() {
    animationController = AnimationController(
        vsync: this,
        duration: widget.animationDuration,
        value: 0.0,
        upperBound: widget.maxValue);
    valueNotifier = ValueNotifier(widget.barValue);
    widgetSize = (widget.size <= 0) ? 100.0 : widget.size;
    circleLength = pi * widgetSize;
    final k = doublePi / circleLength;
    correctAngle = widget.progressStrokeWidth * k;
    startAngle = (correctAngle / 2);
  }
}
