import 'package:circular_progress_stack/circularprogressstack.dart';
import 'package:circular_progress_stack/src/circle_helper.dart';
import 'package:flutter/material.dart';

class StackCircularProgress extends StatefulWidget {
  final double circleSize;
  final List<BarValue> barValues;
  final double strokeWidth;
  final double strokeSpacePadding;
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

  Widget getStackCircle({required List<BarValue> circles}) {
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
