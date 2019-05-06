/**
 * post 列表
 */
import 'package:flutter/material.dart';

import '../model/post.dart';

class PostList extends StatefulWidget {
  PostList({Key key}) : super(key: key);

  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Image.network(posts[index].imageUrl),
              SizedBox(height: 8.0),
              Text(posts[index].title, style: Theme.of(context).textTheme.title),
              Text(posts[index].author, style: Theme.of(context).textTheme.subhead),
              SizedBox(height: 8.0),
            ],
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
