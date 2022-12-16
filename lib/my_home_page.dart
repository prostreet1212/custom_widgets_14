import 'dart:math';

import 'package:custom_widgets_14/widgets/weather_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  double sliderValue = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  /*late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );*/

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final animation=Tween(begin: 0,end: 2*pi).animate(controller);


  @override
  Widget build(BuildContext context) {

    double transform = 50;

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widgets'),
      ),
      body: Column(
        children: [
          AnimatedBuilder(
            animation: animation,
           child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 150,
                height: 150,
                child: CustomPaint(
                  painter: WeatherWidget(opacity: widget.sliderValue),
                ),
              ),
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: animation.value.toDouble(),
                child:Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: CustomPaint(
                      painter: WeatherWidget(opacity: widget.sliderValue),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          Slider(
              min: 0,
              max: 1,
              divisions: 10,
              label: '${widget.sliderValue}',
              value: widget.sliderValue,
              onChanged: (v) {
                setState(() {
                  widget.sliderValue = v;
                });
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            controller.forward();
          });
        },
      ),
    );
  }
}
