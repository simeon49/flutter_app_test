import 'package:flutter/material.dart';

import 'widget/drawer.dart';
import 'widget/post_list.dart';

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
    PostList(),
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
          BottomNavigationBarItem(icon: Icon(Icons.explore), title: Text('Explore')),
          BottomNavigationBarItem(icon: Icon(Icons.history), title: Text('History')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My')),
        ]
      )
    );
  }
}
