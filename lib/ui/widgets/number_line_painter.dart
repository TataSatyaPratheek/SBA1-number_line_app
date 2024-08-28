// number_line_painter.dart
import 'package:flutter/material.dart';
import 'package:number_line_app/core/utils/custom_painter_utils.dart';

class NumberLinePainter extends CustomPainter {
  final int start;
  final int end;

  NumberLinePainter({required this.start, required this.end});

  @override
  void paint(Canvas canvas, Size size) {
    double interval = size.width / (end - start);

    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), linePaint);

    for (int i = start; i <= end; i++) {
      double x = (i - start) * interval;
      CustomPainterUtils.drawTickMark(canvas, Offset(x, size.height / 2), linePaint);
      CustomPainterUtils.drawNumberLabel(
          canvas, Offset(x - 8, size.height / 2 + 15), i.toString());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
