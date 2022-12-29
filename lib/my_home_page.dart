import 'package:custom_widgets_14/models/menu_color.dart';
import 'package:custom_widgets_14/themes/app_theme.dart';
import 'package:custom_widgets_14/utils/utils.dart';
import 'package:custom_widgets_14/widgets/weather_animation.dart';
import 'package:custom_widgets_14/widgets/weather_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Color selectedColor = menuColorList[0].color;
  double sliderValue = 0;

  void changeSliderValue(double v) {
    setState(() {
      sliderValue = v;
    });
  }

  void activateAnimation(AnimationController controller) {
    setState(() {
      if (controller.isCompleted) {
        controller.reverse();
      } else {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      appColor: selectedColor,
      child: Builder(
        builder: (BuildContext innerContext) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Custom Widgets',
                style: TextStyle(color: AppTheme.of(innerContext)),
              ),
              actions: [
                PopupMenuButton<MenuColor>(
                  icon: Icon(
                    Icons.square,
                    color: selectedColor,
                  ),
                  onSelected: (item) {
                    setState(() {
                      if (selectedColor != item.color) {
                        selectedColor = item.color;
                      }
                    });
                  },
                  itemBuilder: (context) => menuColorList
                      .map(
                        (colorItem) => PopupMenuItem<MenuColor>(
                          value: colorItem,
                          child: ListTile(
                            leading: Icon(
                              Icons.square,
                              color: colorItem.color,
                            ),
                            title: Text(colorItem.nameColor),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherAnimation(
                  sliderValue: sliderValue,
                  onTap: activateAnimation,
                ),
                WeatherSlider(
                  innerContext: innerContext,
                  sliderValue: sliderValue,
                  onChange: changeSliderValue,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
