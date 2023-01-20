import 'package:circular_progress_stack/circular_stack.dart';
import 'package:circular_progress_stack/src/circle_helper.dart';
import 'package:flutter/material.dart';

class StackCircularProgress extends StatefulWidget {
  // CirclSize :- you can set circle size as per your need and UI
  final double circleSize;

  // BarValues :- Bar value class has two parameter
  // progressValueInPercentage :- You need to pass progress value in percentage (between 1 to 10) according your progress
  // barColor :- in bar color you need to pass color what you want to set color on perticular bar
  // note :- stack cricle progress draw circle bar accoring barValues so you need to pass how many you want to.
  final List<BarValue> barValues;

  // StrokeWidht :- StrokeWidth property set you bar width , you need to pass value in double (ex - 10.10)
  final double strokeWidth;

  //StrokeSpacePadding :- StrokeSpacePadding indentify spacing between two bars so pass accordingly
  final double strokeSpacePadding;

  //unporgressBarColor :- set color on empty area of progress bar
  final Color unporgressBarColor;

  const StackCircularProgress(
      {super.key,
      this.strokeWidth = 15,
      required this.circleSize,
      this.strokeSpacePadding = 15,
      required this.unporgressBarColor,
      required this.barValues});

  @override
  State<StackCircularProgress> createState() => _StackCircularState();
}

class _StackCircularState extends State<StackCircularProgress> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.circleSize,
        width: widget.circleSize,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: getStackCircle(circles: widget.barValues),
        ));
  }

  // return the list of circle based on barValues list
  Widget getStackCircle({required List<BarValue> circles}) {
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
          child: CircularProgressIndicator(
            strokeWidth: widget.strokeWidth,
            valueColor: AlwaysStoppedAnimation(circles[index].barColor),
            color: Colors.transparent,
            backgroundColor: widget.unporgressBarColor,
            value: getStrokeValue(circles[index].progressValueInPercentage),
          ),
        );
      }),
    );
  }
}
