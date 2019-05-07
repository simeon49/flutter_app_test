/**
 * Sliver
 */
import 'package:flutter/material.dart';
import '../model/post.dart';

/* -------------------- Sliver Widgets -------------------- */
class SliverRouteDemo extends StatefulWidget {
  SliverRouteDemo({
    Key key,
    @required this.title
  }) : super(key: key);

  final String title;

  _SliverRouteDemoState createState() => _SliverRouteDemoState();
}

class _SliverRouteDemoState extends State<SliverRouteDemo> {
  // 网格视图
  Widget _sliverGride() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(child: Image.network(posts[index].imageUrl, fit: BoxFit.cover));
        },
        childCount: posts.length,
      ),
    );
  }

  // 列表视图
  Widget _sliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
              ),
            )
          );
        },
        childCount: posts.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.title.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'https://resources.ninghao.net/images/overkill.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              // sliver: _sliverGride(),
              sliver: _sliverList(),
            ),
          )
        ],
      )
    );
  }
}
