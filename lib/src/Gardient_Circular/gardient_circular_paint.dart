import 'dart:math';

import 'package:circular_progress_stack/src/Gardient_Circular/gradient_circular_utils.dart';
import 'package:flutter/material.dart';

/// Painter to draw the progress bar.
class GradientCircularProgressBarPainter extends CustomPainter {
  /// Progress line thickness.
  final double progressStrokeWidth;

  /// Background circle line thickness.
  final double backStrokeWidth;

  /// Start angle. In this position there will be a zero value.
  final double startAngle;
  final double sweepAngle;
  final double currentLength;

  /// Foreground gradient sweep
  final SweepGradient frontGradient;

  /// Background circle line Color
  final Color backColor;

  /// It's color applied after progress done
  final Color fullProgressColor;

  /// Single color appiled() if it's true
  final bool isFullProgress;

  GradientCircularProgressBarPainter({
    required this.progressStrokeWidth,
    required this.backStrokeWidth,
    required this.startAngle,
    required this.sweepAngle,
    required this.currentLength,
    required this.frontGradient,
    required this.backColor,
    required this.fullProgressColor,
    required this.isFullProgress,
  });
  @override
  void paint(Canvas canvas, Size size) {
    if (isFullProgress && (progressStrokeWidth > 0)) {
      _drawFullProgress(canvas, size);
      return;
    }

    if (backStrokeWidth > 0) {
      _drawBack(canvas, size);
    }

    if (progressStrokeWidth <= 0) {
      return;
    } else if (progressStrokeWidth >= currentLength) {
      _drawLessArcPart(canvas, size);
    } else {
      _drawArcPart(canvas, size);
    }
  }

  @override
  bool shouldRepaint(GradientCircularProgressBarPainter oldDelegate) {
    return oldDelegate.currentLength != currentLength;
  }

  /// Draw main arc (~ 1% - 100%).
  void _drawArcPart(Canvas canvas, Size size) {
    final Rect arcRect = Offset.zero & size;

    final Paint arcPaint = Paint()
      ..shader = frontGradient.createShader(arcRect)
      ..strokeWidth = progressStrokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(arcRect, startAngle, sweepAngle, false, arcPaint);
  }

  /// Draw background circle for progress bar
  void _drawBack(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = backStrokeWidth;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  void _drawFullProgress(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = fullProgressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressStrokeWidth;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  void _drawLessArcPart(Canvas canvas, Size size) {
    double angle = 0;
    double height = 0;

    if (currentLength < progressStrokeWidth / 2) {
      angle = 180;
      height = progressStrokeWidth - currentLength * 2;
    } else if (currentLength < progressStrokeWidth) {
      angle = 0;
      height = currentLength * 2 - progressStrokeWidth;
    } else {
      return;
    }

    final Paint pathPaint = Paint()
      ..shader = frontGradient.createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;

    final Offset circleOffset = Offset(
      (size.width / 2) * cos(startAngle) + size.center(Offset.zero).dx,
      (size.width / 2) * sin(startAngle) + size.center(Offset.zero).dy,
    );

    canvas.drawPath(
      Path.combine(
        PathOperation.xor,
        Path()
          ..addArc(
            Rect.fromLTWH(
              circleOffset.dx - progressStrokeWidth / 2,
              circleOffset.dy - progressStrokeWidth / 2,
              progressStrokeWidth,
              progressStrokeWidth,
            ),
            degToRad(180),
            degToRad(180),
          ),
        Path()
          ..addArc(
            Rect.fromCenter(
              center: circleOffset,
              width: progressStrokeWidth,
              height: height,
            ),
            degToRad(angle),
            degToRad(180),
          ),
      ),
      pathPaint,
    );
  }
}
