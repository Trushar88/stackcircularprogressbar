// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:circular_progress_stack/src/Gardient_Circular/gardient_circular_paint.dart';
import 'package:circular_progress_stack/src/Gardient_Circular/gradient_circular_model.dart';
import 'package:circular_progress_stack/src/Gardient_Circular/gradient_circular_utils.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class GardientStackCircularProgressBar extends StatefulWidget {
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
  final List<GardientBarValue> bars;

  /// Backgound color
  final Color backColor;

  /// Animate pogress time
  final Duration animationDuration;

  /// If is true then single color will applied after progress done
  final bool mergeMode;

  const GardientStackCircularProgressBar({
    Key? key,
    this.size = 100,
    this.startAngle = 0,
    this.maxValue = 100,
    this.progressStrokeWidth = 15,
    this.strokeSpacePadding = 10,
    this.backStrokeWidth = 15,
    required this.bars,
    this.backColor = const Color(0xFF16262D),
    this.animationDuration = const Duration(seconds: 3),
    this.mergeMode = false,
  }) : super(key: key);

  @override
  _GradientStackCircularProgressBarState createState() =>
      _GradientStackCircularProgressBarState();
}

class _GradientStackCircularProgressBarState
    extends State<GardientStackCircularProgressBar>
    with TickerProviderStateMixin {
  final double minSweepAngle = 0.015;
  late double circleLength;
  late double widgetSize;
  late double startAngle;
  late double correctAngle;
  late List<SweepGradient> sweepGradient;
  late List<AnimationController> animationController;
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
  void didUpdateWidget(covariant GardientStackCircularProgressBar oldWidget) {
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
  Widget _circular(int index, Color fullProgressColors) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier[index],
      builder: (BuildContext context, double value, Widget? child) {
        if (value > widget.maxValue) {
          value = widget.maxValue;
        } else if (value < 0) {
          value = 0;
        }
        if (value < animationController[index].value) {
          animationController[index].forward();
        } else {
          animationController[index].animateTo(value);
        }
        return AnimatedBuilder(
          animation: animationController[index],
          builder: (context, snapshot) {
            if ((value != animationController[index].upperBound) &&
                (animationController[index].value >=
                    animationController[index].upperBound)) {
              animationController[index].reset();
              animationController[index].animateTo(value);
            }
            double sweepAngle;
            final reducedValue =
                animationController[index].value / widget.maxValue;
            if (animationController[index].value == 0) {
              sweepAngle = 0;
            } else {
              sweepAngle = (doublePi * reducedValue) - correctAngle;

              if (sweepAngle <= 0) {
                sweepAngle = minSweepAngle;
              }
            }
            final currentLength = reducedValue * circleLength;
            final isFullProgress = widget.mergeMode &
                (animationController[index].value ==
                    animationController[index].upperBound);
            return Transform.rotate(
              angle: degToRad(widget.startAngle - 90),
              child: CustomPaint(
                size: Size(widgetSize, widgetSize),
                painter: GradientCircularProgressBarPainter(
                  progressStrokeWidth: widget.progressStrokeWidth,
                  backStrokeWidth: widget.backStrokeWidth,
                  startAngle: startAngle,
                  sweepAngle: sweepAngle,
                  currentLength: currentLength,
                  frontGradient: sweepGradient[index],
                  backColor: widget.backColor,
                  fullProgressColor: fullProgressColors,
                  isFullProgress: isFullProgress,
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// dipose animation
  void _disposeAnim() {
    for (int i = 0; i < animationController.length; i++) {
      animationController[i].dispose();
    }
  }

  /// return list of circle based on bars value
  Widget _getStackCirculers({required List<GardientBarValue> circles}) {
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
            child: _circular(index, circles[index].fullProgressColors));
      }),
    );
  }

  /// called it in init
  /// initialize animation controller
  /// fill sweep gradinent
  /// initialize valueNotifier
  void _initController() {
    animationController = <AnimationController>[];
    sweepGradient = <SweepGradient>[];
    valueNotifier = [];
    for (int i = 0; i < widget.bars.length; i++) {
      animationController.add(AnimationController(
          vsync: this,
          duration: widget.animationDuration,
          value: 0.0,
          upperBound: widget.maxValue));
      sweepGradient.add(SweepGradient(
        tileMode: TileMode.decal,
        colors: widget.bars[i].barColores,
      ));
      valueNotifier.add(ValueNotifier(widget.bars[i].barValues));
    }
    widgetSize = (widget.size <= 0) ? 100.0 : widget.size;
    circleLength = pi * widgetSize;
    final k = doublePi / circleLength;
    correctAngle = widget.progressStrokeWidth * k;
    startAngle = (correctAngle / 2);
  }
}
