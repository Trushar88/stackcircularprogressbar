// ignore_for_file: must_be_immutable

import 'package:circular_progress_stack/circularprogressstack.dart';
import 'package:circular_progress_stack/src/Painter/circle.dart';
import 'package:circular_progress_stack/src/circle_helper.dart';
import 'package:flutter/material.dart';

class AnimatedStackCircularProgress extends StatefulWidget {
  final double circleSize;
  final List<BarValue>? barValues;
  final double strokeWidth;
  final double strokeSpacePadding;
  final Duration? animationDurationIn;
  final double unPorgressBarWidth;
  final bool isAnimated;
  final Color unProgressBarColor;
  const AnimatedStackCircularProgress(
      {super.key,
      this.strokeWidth = 15,
      required this.circleSize,
      this.strokeSpacePadding = 15,
      this.animationDurationIn,
      required this.isAnimated,
      required this.unPorgressBarWidth,
      required this.unProgressBarColor,
      required this.barValues});

  @override
  State<AnimatedStackCircularProgress> createState() =>
      _AnimatedStackCircularState();
}

class _AnimatedStackCircularState extends State<AnimatedStackCircularProgress>
    with TickerProviderStateMixin {
  late List<AnimationController> controller;
  int animatedValue = 0;
  late List<Animation<int>> animation;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.blue),
        width: widget.circleSize,
        height: widget.circleSize,
        child: getAnimatedStackCircle(circles: widget.barValues!));
  }

  @override
  void didUpdateWidget(covariant AnimatedStackCircularProgress oldWidget) {
    disposeAnim();

    fillController();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    disposeAnim();
    super.dispose();
  }

  void disposeAnim() {
    for (int i = 0; i < controller.length; i++) {
      controller[i].dispose();
      animation[i].removeListener(() {});
    }
  }

  void fillController() {
    controller = <AnimationController>[];
    animation = <Animation<int>>[];
    for (int i = 0; i < widget.barValues!.length; i++) {
      controller.add(AnimationController(
          vsync: this,
          duration: widget.animationDurationIn ?? const Duration(seconds: 2)));
    }
    for (int j = 0; j < controller.length; j++) {
      int durvalue = int.parse(widget.barValues![j].progressValueInPercentage
          .toString()
          .split(".")[0]);
      animation.add(IntTween(begin: 0, end: durvalue).animate(
          CurvedAnimation(parent: controller[j], curve: Curves.fastOutSlowIn)));
    }

    for (int k = 0; k < animation.length; k++) {
      animation[k].addListener(() {
        setState(() {});
      });
      controller[k].forward();
    }
  }

  Widget getAnimatedStackCircle({required List<BarValue> circles}) {
    return Stack(
      children: List.generate(circles.length, (index) {
        return Positioned(
          bottom: getStrokeSpace(
              index, widget.strokeWidth, widget.strokeSpacePadding),
          top: getStrokeSpace(
              index, widget.strokeWidth, widget.strokeSpacePadding),
          left: getStrokeSpace(
              index, widget.strokeWidth, widget.strokeSpacePadding),
          right: getStrokeSpace(
              index, widget.strokeWidth, widget.strokeSpacePadding),
          child: GestureDetector(
            child: CustomPaint(
              painter: Circle(
                  angle: (widget.isAnimated
                          ? animation[index].value.toDouble()
                          : circles[index].progressValueInPercentage) *
                      360 /
                      100,
                  color: Colors.white,
                  stockWidth: widget.strokeWidth,
                  barWidth: widget.unPorgressBarWidth,
                  unSelectedColor: widget.unProgressBarColor,
                  sliderColor: circles[index].barColor),
            ),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    fillController();
    super.initState();
  }
}
