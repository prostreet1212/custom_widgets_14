import 'package:flutter/material.dart';

class WeatherWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
     var paint3 = Paint()
    ..color = Color.fromARGB(255, 250, 220, 92);
    canvas.drawCircle(Offset(0.0, 0.0), 50, paint3);
    Paint paint = Paint()..color = Colors.blue;
    Paint paint2 = Paint()..color = Colors.green;

     double rectTop = 110.0;
     double rectBottom = rectTop + 40.0;

     double figureLeftEdge = size.width / 4;
     double figureRightEdge = size.width - 90.0;
     double figureCenter = size.width / 2;



    RRect rect = RRect.fromRectAndRadius(
        Rect.fromPoints(Offset(figureCenter, 130.0), Offset(110, 70)), Radius.circular(0));
    canvas.drawRRect(rect, paint2);

    canvas.drawCircle(Offset(5, 100.0), 30, paint);
    canvas.drawCircle(
      Offset(60, 90.0),
      40.0,
      paint,
    );
     canvas.drawCircle(
      Offset(110, 97.0),
      33.0,
      paint,
    );


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
