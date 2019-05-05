/**
 * Trun Box
 */
import 'package:flutter/material.dart';

class TurnBox extends StatefulWidget {
  TurnBox({
    Key key,
    this.turns = .0,
    this.duration = 200,
    @required this.child
  }) : super(key: key);

  // 旋转的“圈”数,一圈为360度，如0.25圈即90度
  final double turns;

  // 过渡动画执行的总时长(ms)
  final int duration;

  final child;

  _TurnBoxState createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity
    );
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.duration ?? 200),
        curve: Curves.easeOut
      );
    }
  }
}


class TurnBoxRoute extends StatefulWidget {
  TurnBoxRoute({Key key}) : super(key: key);

  _TurnBoxRouteState createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _truns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TurnBox')),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(turns: _truns, duration: 500, child: Icon(Icons.refresh, size: 50,)),
            TurnBox(turns: _truns, duration: 1000, child: Icon(Icons.refresh, size: 150,)),
            RaisedButton(child: Text('顺时针旋转1/5圈'), onPressed: () { setState(() {
              _truns += .2;
            });}),
            RaisedButton(child: Text('逆时针旋转1/5圈'), onPressed: () { setState(() {
              _truns -= .2;
            });})
          ],
        ),
      ),
    );
  }
}
