/**
 * 卡片Card
 */
import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  CardDemo({Key key}) : super(key: key);

  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {

  Widget _postCards (BuildContext context, int index) {
    final Post post = posts[index];
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: EdgeInsets.only(bottom: 32.0),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16/9,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)
              ),
              child: Image.network(post.imageUrl, fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.imageUrl)
            ),
            title: Text(post.title),
            subtitle: Text(post.author)
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text.rich(
              TextSpan(text: post.description),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(child: Text('Like'.toUpperCase()), onPressed: () {}),
                FlatButton(child: Text('Read'.toUpperCase()), onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('卡片 Card')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: _postCards,
        ),
      )
    );
  }
}
