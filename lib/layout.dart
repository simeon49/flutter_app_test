/**
 * 布局
 */

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


/* -------------------- 线性布局 Row, Column -------------------- */
class TestRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('layout Row')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(' hello world '),
              Text(' I am Jack ')
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(' hello world '),
              Text(' I am Jack ')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(' hello world '),
              Text(' I am Jack ')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(' hello world ', style: TextStyle(fontSize: 30.0),),
              Text(' I am Jack ')
            ],
          )
        ],
      )
    );
  }
}

class TestColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('layout Column'),),
      body: Container (
        color: Colors.green,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(' Hello, '),
                    Text(' I am Simeon! '),
                    Text(
                      'ABC '* 1000,
                      softWrap: true,
                      maxLines: 10
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}


/* -------------------- 弹性布局 Flex (可用Row, Column 替代) -------------------- */
class TestFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('弹性布局 Flex'),),
      body: Container (
        child: Column(
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100.0,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        // height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50.0,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}


/* -------------------- 流式布局 Wrap, Flow -------------------- */
class TestFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局 Wrap, Flow'),
      ),
      // body: Wrap(
      //   direction: Axis.horizontal, // 主轴方向
      //   spacing: 8.0, // 主轴方向间距
      //   runSpacing: 14.0,  // 纵轴方向间距
      //   alignment: WrapAlignment.center,  // 主轴对齐方式
      //   crossAxisAlignment: WrapCrossAlignment.center,
      //   children: <Widget>[
      //     Container(width: 80.0, height: 80.0, color: Colors.red),
      //     Container(width: 80.0, height: 80.0, color: Colors.green),
      //     Container(width: 90.0, height: 90.0, color: Colors.blue),
      //     Container(width: 80.0, height: 80.0, color: Colors.yellow),
      //     Container(width: 80.0, height: 80.0, color: Colors.brown),
      //     Container(width: 80.0, height: 80.0, color: Colors.purple),
      //   ],
      // ),

      body: Flow(
        delegate: MyFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          Container(width: 80.0, height: 80.0, color: Colors.red),
          Container(width: 80.0, height: 80.0, color: Colors.green),
          Container(width: 90.0, height: 90.0, color: Colors.blue),
          Container(width: 80.0, height: 80.0, color: Colors.yellow),
          Container(width: 80.0, height: 80.0, color: Colors.brown),
          Container(width: 80.0, height: 80.0, color: Colors.purple),
        ],
      )
    );
  }
}

class MyFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  MyFlowDelegate({this.margin}) : assert(margin != null);

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}


/* -------------------- 层叠布局 Stack, Postioned -------------------- */
class TestStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('层叠布局 Stack, Postioned'),),
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.loose,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(width: 100, height: 100, color: Colors.red[300]),
          Positioned(left: 10.0, top: 10.0, child: Container(width: 100, height: 100, color: Colors.red[200])),
          Positioned(left: 20.0, top: 20.0, child: Container(width: 100, height: 100, color: Colors.red[100])),
        ],
      ),
    );
  }
}
