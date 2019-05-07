/**
 * post 列表
 */
import 'package:flutter/material.dart';

import '../model/post.dart';
import '../widget/hero_demo.dart';
import '../page/post_show.dart';

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
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  // 固定图片显示比例
                  Hero(
                    tag: 'post-show#${index}',
                    child: AspectRatio(aspectRatio: 16 / 9, child: Image.network(posts[index].imageUrl, fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 8.0),
                  Text(posts[index].title, style: Theme.of(context).textTheme.title),
                  Text(posts[index].author, style: Theme.of(context).textTheme.subhead),
                  SizedBox(height: 8.0),
                ],
              ),
              // 溅磨效果
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(0.2),
                      highlightColor: Colors.white.withOpacity(0.5),
                      onTap: () => {
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text('Tap'),
                        // ))
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return PostShowRoute(id: index);
                          })
                        )
                      }
                    ),
                  )
                ),
              )
            ]
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
