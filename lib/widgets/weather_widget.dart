import 'package:flutter/material.dart';

class WeatherWidget extends CustomPainter {
  double opacity;
  Animation animation;

  WeatherWidget({required this.opacity, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.lightBlueAccent.withOpacity(getDropsOpacity(opacity));
    Paint paint2 = Paint()
      ..color = Colors.grey.withOpacity(getCloudOpacity(opacity));
    var paint3 = Paint()
      ..color = const Color.fromARGB(255, 250, 220, 92)
          .withOpacity(getSunOpacity(opacity));

    final strokeWidth = size.width / 15.0;
    final circleCenter = Offset(size.width / 2, size.height / 2);
    final circleRadius = (size.width - strokeWidth) / 2.4;

    double x = circleCenter.dx;
    double y = circleCenter.dy;

    //Солнце
    canvas.drawCircle(circleCenter, circleRadius, paint3);
    //Облачко
    RRect rect = RRect.fromRectAndRadius(
        Rect.fromPoints(Offset(-31 + x, 40.0 + y), Offset(33 + x, 49.1 + y)),
        const Radius.circular(0));
    Path cloudPath = Path();
    cloudPath.addRRect(rect);
    cloudPath.addOval(Rect.fromCircle(
        center: Offset(-30 + x, 31.5 + y), radius: circleRadius / 2));
    cloudPath.addOval(Rect.fromCircle(
        center: Offset(0 + x, 23 + y), radius: circleRadius * 2 / 3));
    cloudPath.addOval(Rect.fromCircle(
        center: Offset(30 + x, 30 + y), radius: circleRadius * 0.55));
    canvas.drawPath(cloudPath, paint2);

    //Капли
    Path dropPath = Path()
      ..moveTo(-33 + x, 58 + y)
      ..lineTo(-27 + x, 60 + y)
      ..lineTo(-32 + x, 70 + y)
      ..lineTo(-38 + x, 68 + y)
      ..close();
    canvas.drawPath(dropPath, paint);

    Path dropPath2 = Path()
      ..moveTo(-3 + x, 58 + y)
      ..lineTo(3 + x, 60 + y)
      ..lineTo(-2 + x, 70 + y)
      ..lineTo(-8 + x, 68 + y)
      ..close();
    canvas.drawPath(dropPath2, paint);

    Path dropPath3 = Path()
      ..moveTo(27 + x, 58 + y)
      ..lineTo(33 + x, 60 + y)
      ..lineTo(28 + x, 70 + y)
      ..lineTo(22 + x, 68 + y)
      ..close();
    canvas.drawPath(dropPath3, paint);

    //текст
    final textSpan = TextSpan(
      text: 'Облачно,\n12 градусов',
      style: TextStyle(
          color: Colors.black.withOpacity(animation.value), fontSize: 16),
    );
    TextPainter tp = TextPainter(
        text: textSpan,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset(-45.0 + x, 65.0 + y));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double getDropsOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }
    return 10 / 3 * value - 7 / 3;
  }

  double getCloudOpacity(double value) {
    if (value > 0.5) {
      return 1;
    }
    return value * 2;
  }

  double getSunOpacity(double value) {
    if (value < 0.6) {
      return 1;
    }
    return -2 * value + 2;
  }
}
