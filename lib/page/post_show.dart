/**
 * Post 详情页
 */
import 'package:flutter/material.dart';
import '../model/post.dart';

class PostShowRoute extends StatefulWidget {
  const PostShowRoute({
    Key key,
    @required this.id
  }) : super(key: key);

  final int id;

  _PostShowRouteState createState() => _PostShowRouteState();
}

class _PostShowRouteState extends State<PostShowRoute> {
  Post _post;

  @override
  void initState() {
    super.initState();
    _post = posts[widget.id];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Show')),
      body: Container(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'post-show#${widget.id}',
              child: AspectRatio(aspectRatio: 16 / 9, child: Image.network(_post.imageUrl, fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(_post.title, style: Theme.of(context).textTheme.title),
                  Text(_post.author, style: Theme.of(context).textTheme.subhead),
                  SizedBox(height:32.0),
                  Text(_post.description, style: TextStyle(color: Colors.grey)),
                ],
              ),
            )

          ],
        )
      ),
    );
  }
}
