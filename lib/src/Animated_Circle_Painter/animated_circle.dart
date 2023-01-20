// ignore_for_file: must_be_immutable

import 'package:circular_progress_stack/circular_stack.dart';
import 'package:circular_progress_stack/src/Animated_Circle_Painter/circle.dart';
import 'package:circular_progress_stack/src/circle_helper.dart';
import 'package:flutter/material.dart';

class AnimatedStackCircularProgress extends StatefulWidget {
  // CirclSize :- you can set circle size as per your need and UI
  final double circleSize;

  // BarValues :- Bar value class has two parameter
  // progressValueInPercentage :- You need to pass progress value in percentage (between 1 to 10) according your progress
  // barColor :- in bar color you need to pass color what you want to set color on perticular bar
  // note :- stack cricle progress draw circle bar accoring barValues so you need to pass how many you want to.
  final List<BarValue>? barValues;

  // StrokeWidht :- StrokeWidth property set you bar width , you need to pass value in double (ex - 10.10)
  final double strokeWidth;

  //StrokeSpacePadding :- StrokeSpacePadding indentify spacing between two bars so pass accordingly
  final double strokeSpacePadding;

  //animationDurationIn :- this duration is use for bar animation you need to paas according your need and you want to animate in duration
  final Duration? animationDurationIn;

  //unPorgressBarWidth :- unPorgressBarWidth set the width of unprogress bar
  final double unPorgressBarWidth;

  //isAnimated :- if you want to diplay bar wothout animated you can set this value as a false
  //default value is true
  final bool isAnimated;

  //unporgressBarColor :- set color on empty area of progress bar
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
  late List<Animation<int>> animation;
  int animatedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.blue),
        width: widget.circleSize,
        height: widget.circleSize,
        child: getAnimatedStackCircle(circles: widget.barValues!));
  }

  //update the animation while you set the circle increase or decrease
  @override
  void didUpdateWidget(covariant AnimatedStackCircularProgress oldWidget) {
    disposeAnim();
    fillController();
    super.didUpdateWidget(oldWidget);
  }

  //dispose the animation
  @override
  void dispose() {
    disposeAnim();
    super.dispose();
  }

  //use this function to dispose the controller of animation
  void disposeAnim() {
    for (int i = 0; i < controller.length; i++) {
      controller[i].dispose();
      animation[i].removeListener(() {});
    }
  }

  // this funtion is use to fill the animation controller according barvalues
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

  // return the list of circle based on barValues list
  Widget getAnimatedStackCircle({required List<BarValue> circles}) {
    return Stack(
      children: List.generate(circles.length, (index) {
        return Positioned(
          //set the bottom position of perticular bar
          bottom: getStrokeSpace(
              index, widget.strokeWidth, widget.strokeSpacePadding),
          //set the top position of perticular bar
          top: getStrokeSpace(
              index, widget.strokeWidth, widget.strokeSpacePadding),
          //set the left position of perticular bar
          left: getStrokeSpace(
              index, widget.strokeWidth, widget.strokeSpacePadding),
          //set the right position of perticular bar
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

  // initialize animation controller
  @override
  void initState() {
    fillController();
    super.initState();
  }
}
