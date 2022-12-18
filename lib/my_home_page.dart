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
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final animation = Tween(begin: 0.5, end: 1.2).animate(controller);
  late final animation1 = Tween(begin: 0.5, end: 100.0).animate(controller);
  late final animation2 = Tween(begin: 0.0, end: 1.0).animate(controller);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widgets'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedBuilder(
            animation: Listenable.merge([animation, animation1]),
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, animation1.value)
                  ..scale(animation.value),
                transformHitTests: true,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (controller.isCompleted) {
                        controller.reverse();
                      } else {
                        controller.forward();
                      }
                    });
                  },
                    child: SizedBox(
                      height: 150+animation1.value,
                      width: 150,
                      child: CustomPaint(
                        painter: WeatherWidget(
                            opacity: widget.sliderValue, animation: animation2),
                      ),
                    ),
                ),
              );
            },
          ),


          //--------
          Column(
            children: [
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
                  }),
              Text(
                'Испортить погоду',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
