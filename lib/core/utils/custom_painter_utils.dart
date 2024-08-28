import 'package:flutter/material.dart';

class CustomPainterUtils {
  static void drawTickMark(Canvas canvas, Offset position, Paint paint) {
    canvas.drawLine(
      Offset(position.dx, position.dy - 10),
      Offset(position.dx, position.dy + 10),
      paint,
    );
  }

  static void drawNumberLabel(Canvas canvas, Offset position, String label) {
    TextSpan span = TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16),
      text: label,
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(canvas, position);
  }
}
