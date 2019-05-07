/**
 * Hero动画
 */
import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    Key key,
    @required this.photo,
    this.width,
    @required this.child,
  }) : super(key: key);

  final String photo;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Image.asset(
          photo,
          fit: BoxFit.contain
        ),
      ),
    );
  }
}
