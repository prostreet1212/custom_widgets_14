import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Tint extends SingleChildRenderObjectWidget{
   const Tint({required this.color,required Widget child,Key? key}):super(key:key,child: child);

     final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTint(color: color);
  }

}

class RenderTint extends RenderProxyBox{

  Color _color;
  RenderTint({Color color=Colors.transparent,RenderBox? child}):_color=color,super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
   context.canvas.drawColor(_color, BlendMode.srcOver);
   if(child!=null){
     context.paintChild(child!, offset);
   }
  }
}