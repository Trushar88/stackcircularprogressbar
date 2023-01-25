// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:circular_progress_stack/src/Gradient_Circular/gradient_circular_paint.dart';
import 'package:circular_progress_stack/src/utils.dart';
import 'package:flutter/material.dart';

class SingleGradientStackCircularProgressBar extends StatefulWidget {
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

  /// Backgound color
  final Color backColor;

  ///progress color
  final List<Color> barColores;

  ///progress value
  final double barValue;

  /// Animate pogress time
  final Duration animationDuration;

  /// progress done color
  final Color fullProgressColor;

  /// If is true then single color will applied after progress done
  final bool mergeMode;

  /// middel text show hide
  final bool isTextShow;

  ///TextStyle of middle text
  final TextStyle textStyle;

  const SingleGradientStackCircularProgressBar({
    Key? key,
    this.size = 100,
    this.startAngle = 0,
    this.barValue = 55,
    this.isTextShow = true,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 20),
    this.maxValue = 100,
    this.fullProgressColor = Colors.blue,
    this.barColores = const [Colors.red, Colors.blue],
    this.progressStrokeWidth = 15,
    this.strokeSpacePadding = 10,
    this.backStrokeWidth = 15,
    this.backColor = const Color(0xFF16262D),
    this.animationDuration = const Duration(seconds: 3),
    this.mergeMode = false,
  }) : super(key: key);

  @override
  _SingleGradientStackCircularProgressBarState createState() =>
      _SingleGradientStackCircularProgressBarState();
}

class _SingleGradientStackCircularProgressBarState
    extends State<SingleGradientStackCircularProgressBar>
    with TickerProviderStateMixin {
  final double minSweepAngle = 0.015;
  late double circleLength;
  late double widgetSize;
  late double startAngle;
  late double correctAngle;
  late SweepGradient sweepGradient;
  late AnimationController animationController;
  late ValueNotifier<double> valueNotifier;

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
      covariant SingleGradientStackCircularProgressBar oldWidget) {
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
            final isFullProgress = widget.mergeMode &
                (animationController.value == animationController.upperBound);
            return Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: degToRad(widget.startAngle - 90),
                  child: CustomPaint(
                    size: Size(widgetSize, widgetSize),
                    painter: GradientCircularProgressBarPainter(
                      progressStrokeWidth: widget.progressStrokeWidth,
                      backStrokeWidth: widget.backStrokeWidth,
                      startAngle: startAngle,
                      sweepAngle: sweepAngle,
                      currentLength: currentLength,
                      frontGradient: sweepGradient,
                      backColor: widget.backColor,
                      fullProgressColor: widget.fullProgressColor,
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
    sweepGradient = SweepGradient(
      tileMode: TileMode.decal,
      colors: widget.barColores,
    );
    valueNotifier = ValueNotifier(widget.barValue);

    widgetSize = (widget.size <= 0) ? 100.0 : widget.size;
    circleLength = pi * widgetSize;
    final k = doublePi / circleLength;
    correctAngle = widget.progressStrokeWidth * k;
    startAngle = (correctAngle / 2);
  }
}
