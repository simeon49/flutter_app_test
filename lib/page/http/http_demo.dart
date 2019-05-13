import 'dart:convert';

/**
 * http
 */
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatelessWidget {
  const HttpDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('http')),
      body: HttpHome(),
    );
  }
}

class HttpHome extends StatefulWidget {
  HttpHome({Key key}) : super(key: key);

  _HttpHomeState createState() => _HttpHomeState();
}

class _HttpHomeState extends State<HttpHome> {


  @override
  void initState() {
    super.initState();
  }

  Future<List<Post>> fetchData() async {
    final response = await http.get('https://raw.githubusercontent.com/simeon49/flutter_app_test/master/lib/model/fake_post.json');

    if (response.statusCode != 200) {
      throw Exception('fetchData error witch status code: ${response.statusCode}');
    }

    final responseBody = json.decode(response.body);
    final List<Post> res = responseBody['data']
      .map<Post>((item) => Post.fromJson(item))
      .toList();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: fetchData(),
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('loading...'));
          }

          final List<Post>data = snapshot.data;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(data[index].imageUrl)),
                title: Text(data[index].title),
                subtitle: Text(data[index].author),
              );
            },
          );
        },
      ),
    );
  }
}


class Post {
  Post({
    this.id,
    this.title,
    this.author,
    this.description,
    this.imageUrl
  });

  Post.fromJson(Map json)
    : id=json['id'],
      title=json['title'],
      author=json['author'],
      description=json['description'],
      imageUrl=json['imageUrl'];

  Map toJson() => {
    'id': id,
    'title': title,
    'author': author,
    'description': description,
    'imageUrl': imageUrl,
  };

  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
}
