import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import 'inner_shadow_widget.dart';

class WeatherSlider extends StatelessWidget {
  const WeatherSlider(
      {Key? key,
      required this.innerContext,
      required this.sliderValue,
      required this.onChange})
      : super(key: key);
  final BuildContext innerContext;
  final double sliderValue;
  final Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            min: 0,
            max: 1,
            divisions: 10,
            label: '$sliderValue',
            value: sliderValue,
            onChanged: (double v) {
              onChange(v);
            }),
        InnerShadow(
          blur: 10,
          color: AppTheme.of(innerContext),
          offset: const Offset(5, 5),
          child: const Text(
            'Испортить погоду',
            style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
          width: 100,
        ),
      ],
    );
  }
}
