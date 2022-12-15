import 'package:custom_widgets_14/widgets/weather_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
        body: Container(
          child: Center(
            child: CustomPaint(
              painter: WeatherWidget(),
            ),
          ),
        ));
  }
}
