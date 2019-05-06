import 'package:flutter/material.dart';

import 'widget/drawer.dart';
import 'widget/post_list.dart';
import 'widget/base_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        highlightColor: Color.fromRGBO(255, 255, 255, .5),
        splashColor: Colors.green,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _tabePages = [
    PostList(),
    BasicDemo(),
    PostList(),
    PostList(),
  ];

  void _onTapHandler(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('My first flutter app'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), tooltip: 'Search sth', onPressed: () => debugPrint('search button is pressed.')),
        ],
        elevation: 0,
      ),
      body: _tabePages[_currentIndex],
      drawer: HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), title: Text('基础练习')),
          BottomNavigationBarItem(icon: Icon(Icons.today), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My')),
        ]
      )
    );
  }
}
