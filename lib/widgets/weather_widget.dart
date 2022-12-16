import 'package:flutter/material.dart';

class WeatherWidget extends CustomPainter {
  double opacity;

  WeatherWidget({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.lightBlueAccent.withOpacity(getDropsOpacity(opacity));
    Paint paint2 = Paint()
      ..color = Colors.grey.withOpacity(getCloudOpacity(opacity));
    var paint3 = Paint()
      ..color =
          Color.fromARGB(255, 250, 220, 92).withOpacity(getSunOpacity(opacity));

    double x = 75;
    double y = 75;

    //Солнце
    canvas.drawCircle(Offset(0.0 + x, 0 + y), 60, paint3);
    //Облачко
    RRect rect = RRect.fromRectAndRadius(
        Rect.fromPoints(Offset(-55 + x, 40.0 + y), Offset(55 + x, 70 + y)),
        Radius.circular(0));
    canvas.drawRRect(rect, paint2);
    canvas.drawCircle(Offset(-55 + x, 40.0 + y), 30, paint2);
    canvas.drawCircle(
      Offset(0 + x, 30.0 + y),
      40.0,
      paint2,
    );
    canvas.drawCircle(
      Offset(50 + x, 37 + y),
      33.0,
      paint2,
    );

    //Капли
    Path path = Path()
      ..moveTo(-55 + x, 80 + y)
      ..lineTo(-49 + x, 82 + y)
      ..lineTo(-59 + x, 102 + y)
      ..lineTo(-65 + x, 100 + y)
      ..close();
    canvas.drawPath(path, paint);

    Path path2 = Path()
      ..moveTo(-5 + x, 80 + y)
      ..lineTo(1 + x, 82 + y)
      ..lineTo(-9 + x, 102 + y)
      ..lineTo(-15 + x, 100 + y)
      ..close();
    canvas.drawPath(path2, paint);

    Path path3 = Path()
      ..moveTo(45 + x, 80 + y)
      ..lineTo(51 + x, 82 + y)
      ..lineTo(41 + x, 102 + y)
      ..lineTo(35 + x, 100 + y)
      ..close();
    canvas.drawPath(path3, paint);
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
    /*  if(value>0.7){
      return 1;
    }
    return (10/7*value);*/
    if (value > 0.5) {
      return 1;
    }
    return value * 2;
    1 - (0.1 * 2);
  }

  double getSunOpacity(double value) {
    if (value < 0.6) {
      return 1;
    }
    return -2 * value + 2;
  }
}
