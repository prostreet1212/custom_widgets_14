import 'package:custom_widgets_14/models/menu_color.dart';
import 'package:custom_widgets_14/themes/app_theme.dart';
import 'package:custom_widgets_14/utils/utils.dart';
import 'package:custom_widgets_14/widgets/inner_shadow_widget.dart';
import 'package:custom_widgets_14/widgets/weather_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final animation = Tween(begin: 0.5, end: 1.2).animate(controller);
  late final animation1 = Tween(begin: 0.0, end: 100.0).animate(controller);
  late final animation2 = Tween(begin: 0.0, end: 1.0).animate(controller);
  Color selectedColor = menuColorList[0].color;
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      appColor: selectedColor,
      child: Builder(
        builder: (innerContext) {
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
                          height: 130,
                          width: 170,
                          child: CustomPaint(
                            painter: WeatherWidget(
                                opacity: sliderValue, animation: animation2),
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
                        label: '$sliderValue',
                        value: sliderValue,
                        onChanged: (v) {
                          setState(() {
                            sliderValue = v;
                          });
                        }),
                    InnerShadow(
                      blur: 10,
                      color: AppTheme.of(innerContext),
                      offset: const Offset(5, 5),
                      child: const Text(
                        'Испортить погоду',
                        style: TextStyle(
                            fontSize: 44, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 100,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
