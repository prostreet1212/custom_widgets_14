import 'package:custom_widgets_14/models/menu_color.dart';
import 'package:flutter/material.dart';

List<MenuColor> menuColorList = [
  MenuColor(color: Colors.red, nameColor: 'Красный'),
  MenuColor(color: Colors.yellow, nameColor: 'Желтый'),
  MenuColor(color: Colors.green, nameColor: 'Зеленый'),
  MenuColor(color: Colors.purple, nameColor: 'Пурпурный'),
  MenuColor(color: Colors.lightBlueAccent, nameColor: 'Голубой'),
];

class CloudClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(-20, 0, 130, 215);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }

}

