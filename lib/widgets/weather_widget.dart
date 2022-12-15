import 'package:flutter/material.dart';


class WeatherWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = Colors.blueAccent.withOpacity(0.5)
        ..style=PaintingStyle.fill;
    var path=Path()
        ..moveTo(116, 10)
    ..lineTo(172, 10)
    ..lineTo(55, 126)
    ..lineTo(28, 100)
    ..close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}