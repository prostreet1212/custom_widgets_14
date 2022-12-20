import 'package:custom_widgets_14/models/menu_color.dart';
import 'package:custom_widgets_14/themes/app_theme.dart';
import 'package:custom_widgets_14/utils/utils.dart';
import 'package:custom_widgets_14/widgets/inner_shadow_widget.dart';
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
  late final animation = Tween(begin: 1.0, end: 1.2).animate(controller);
  late final animation1 = Tween(begin: 0.5, end: 100.0).animate(controller);
  late final animation2 = Tween(begin: 0.0, end: 1.0).animate(controller);
   Color selectedColor=Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Widgets'),
        actions: [
          PopupMenuButton<MenuColor>(
              icon: Icon(
                Icons.square,
                color: selectedColor,
              ),
            onSelected: (item){
              setState(() {
                if(selectedColor!=item.color){
                  selectedColor=item.color;
                  print(selectedColor.toString());
                }
              });
            },
              itemBuilder: (context) => //<PopupMenuEntry<MenuColor>>[
                  menuColorList
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


              //PopupMenuItem<MenuColor>(child: ListTile())
              //]

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
                    height: 150 + animation1.value,
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
              AppTheme(
                  appColor: selectedColor,
                  child: Builder(
                    builder: (innerContext) {
                      return InnerShadow(
                          blur: 10,
                          color: AppTheme.of(innerContext),
                          offset: Offset(5, 5),
                          child: Text(
                            'Испортить погоду',
                            style: TextStyle(
                                fontSize: 44, fontWeight: FontWeight.bold),
                          ));
                    },
                  )),
              const SizedBox(
                height: 20,
                width: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}
