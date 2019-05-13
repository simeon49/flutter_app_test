import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation 动画')),
      body: AnimationHome(),
    );
  }
}

class AnimationHome extends StatefulWidget {
  AnimationHome({Key key}) : super(key: key);

  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> with TickerProviderStateMixin {
  AnimationController _animationControler;
  CurvedAnimation _curved;  // 动画曲线
  Animation _animationColor;
  Animation _animationSize;

  @override
  void initState() {
    super.initState();

    _animationControler = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _curved = CurvedAnimation(parent: _animationControler, curve: Curves.bounceOut);

    _animationColor = ColorTween(begin: Colors.red[200], end: Colors.red[900]).animate(_curved);
    _animationSize = Tween(begin: 32.0, end: 200.0).animate(_curved);

    // _animationControler.addListener(() {
    //   // print('${_animationControler.value}');
    //   setState(() {});
    // });

    _animationControler.addStatusListener((AnimationStatus status) {
      print('${status.toString()}');
    });
  }

  @override
  void dispose() {
    _animationControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: MyHeart(
        animationColor: _animationColor,
        animationSize: _animationSize,
        animationControler: _animationControler,
      )
    );
  }
}

class MyHeart extends AnimatedWidget {
  MyHeart({
    @required this.animationColor,
    @required this.animationSize,
    @required this.animationControler,
  }) : super(listenable: animationControler);

  final Animation animationColor;
  final Animation animationSize;
  final AnimationController animationControler;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.favorite),
        iconSize: animationSize.value,
        color: animationColor.value,
        onPressed: () {
          if (animationControler.status == AnimationStatus.completed) {
            animationControler.reverse();
          } else {
            animationControler.forward();
          }
        },
      );
  }
}
