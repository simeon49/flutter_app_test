/**
 * 容器
 */
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


/* -------------------- 布局限制类容器 ConstrainedBox -------------------- */
class TestConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('布局限制类容器 ConstrainedBox'),),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 50.0,
        ),
        child: Container(
          height: 5.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
      )
    );
  }
}


/* -------------------- 装饰类容器 DecortedBox -------------------- */
class TestDecoratedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('装饰类容器 DecortedBox'),),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Colors.red, Colors.orange[300]]), //背景渐变
          borderRadius: BorderRadius.circular(7.0), //3像素圆角
          boxShadow: [ //阴影
            BoxShadow(
                color:Colors.black54,
                offset: Offset(2.0,2.0),
                blurRadius: 4.0
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text('GradientButton', style: TextStyle(color: Colors.white))
        ),
      )
    );
  }
}


/* -------------------- 容器 Container -------------------- */
class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container')),
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(math.pi / 8),
          child: Container(
            alignment: Alignment.center,
            width: 200.0,
            height: 150.0,
            decoration: BoxDecoration(  // 背景装饰
              gradient: RadialGradient(
                colors: [Colors.black, Colors.blue],
                center: Alignment.topLeft,
                radius: .98
              ),
              boxShadow: [ // 卡片阴影
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
                )]
            ),
            child: Text('Conatiner', style: TextStyle(fontSize: 32.0, color: Colors.white),),
          ),
        )
      )
    );
  }
}
