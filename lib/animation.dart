/**
 * 动画
 */
import 'package:flutter/material.dart';


class GrowTransition extends AnimatedWidget {
  GrowTransition({
    Key key,
    this.child,
    @required this.animation
  }) : assert(animation != null), super(key: key, listenable: animation);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (BuildContext ctx, Widget child) {
          return Container(
            child: child,
            width: animation.value,
            height: animation.value,
          );
        }
      ),
    );
  }
}

class ScalAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScalAnimationRouteState();
  }
}

class _ScalAnimationRouteState extends State<ScalAnimationRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
      duration: Duration(seconds: 3), vsync: this);
    this.animation = Tween(begin: 0.0, end: 500.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    this._controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('逐渐变大的图片')),
      body: GrowTransition(
        child: Image.asset('assets/images/pic.jpg'),
        animation: this.animation,
      )
    );
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }
}


/* -------------------- Hero动画 -------------------- */

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    Key key,
    @required this.photo,
    @required this.onTap,
    this.width
  }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimationRoute extends StatelessWidget {
  const HeroAnimationRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero 动画')),
      body:  Container(
        alignment: Alignment.topCenter,
        child: PhotoHero(
          photo: 'assets/images/pic.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(title: const Text('Flippers Page'),),
                  body: Container(
                    // The blue background emphasizes that it's a new route.
                    color: Colors.lightBlueAccent,
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.topLeft,
                    child: PhotoHero(
                      photo: 'assets/images/pic.jpg',
                      width: 100.0,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                );
              }
            ));
          },
        ),
      )
    );
  }
}
