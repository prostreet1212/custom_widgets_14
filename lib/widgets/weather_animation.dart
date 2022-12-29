import 'package:custom_widgets_14/widgets/weather_widget.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class WeatherAnimation extends StatefulWidget {
  const WeatherAnimation(
      {Key? key, required this.sliderValue, required this.onTap})
      : super(key: key);
  final double sliderValue;
  final Function(AnimationController controller) onTap;

  @override
  State<WeatherAnimation> createState() => _WeatherAnimationState();
}

class _WeatherAnimationState extends State<WeatherAnimation>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late final animation = Tween(begin: 1.0, end: 1.5).animate(controller);
  late final animation1 = Tween(begin: 0.0, end: 100.0).animate(controller);
  int temp = 24;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([animation, animation1]),
      builder: (context, child) {
        return Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..translate(0.0, animation1.value)
            ..scale(animation.value),
          transformHitTests: true,
          child: GestureDetector(
            onTap: () {
              widget.onTap(controller);
            },
            child: Column(
              children: [
                ClipRect(
                  clipper: CloudClip(),
                  child: CustomPaint(
                    size: const Size(104.0, 125.0),
                    painter: WeatherWidget(opacity: widget.sliderValue),
                  ),
                ),
                Text(
                  'Облачно,\n${(temp - widget.sliderValue * 10).toInt()} градусов',
                  style: TextStyle(
                      color: Colors.black.withOpacity(widget.sliderValue),
                      fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
