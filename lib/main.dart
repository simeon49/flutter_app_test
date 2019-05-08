import 'package:flutter/material.dart';

import 'widget/drawer.dart';
import 'widget/post_list.dart';
import 'widget/base_demo.dart';
import 'page/sliver_demo.dart';
import 'page/form_demo.dart';

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
  List<Widget> _widgets;
  Widget _tabeView;

  @override
  void initState() {
    super.initState();
    _widgets = [
      PostList(),
      BasicDemo(),
    ];
    _tabeView = _widgets[_currentIndex];
  }

  void _onTapHandler(index) {
    setState(() {
      if (index < 2) {
        _tabeView = _widgets[index];
        _currentIndex = index;
      } else {
        StatefulWidget route = null;
        if (index == 2) {
          route = SliverRouteDemo(title: 'Hello');
        } else {
          route = FormRoute();
        }
        Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return route;
          }
        ));
      }
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
      body: _tabeView,
      drawer: HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), title: Text('基础练习')),
          BottomNavigationBarItem(icon: Icon(Icons.today), title: Text('Sliver')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My')),
        ]
      )
    );
  }
}
