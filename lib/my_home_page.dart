import 'package:custom_widgets_14/widgets/weather_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);
  double sliderValue=0;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widgets'),
      ),
      body: Column(
        children: [
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: CustomPaint(
                    painter: WeatherWidget(opacity: widget.sliderValue),
                  ),
                ),
              ),
          SizedBox(height: 30,),
          Slider(
            min: 0,
              max: 1,
              divisions: 10,
              label: '${widget.sliderValue}',
              value: widget.sliderValue,
              onChanged: (v){
                setState(() {
                  widget.sliderValue=v;
                });
              })
        ],
      ),
    );
  }
}

