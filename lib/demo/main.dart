import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './counter.dart';
import './tapboxs.dart';
import './login.dart';
import './layout.dart';
import './container.dart';
import './scrollable.dart';
import './inherited_widget.dart';
import './theme.dart';
import './event.dart';
import './animation.dart';
import './turn_box.dart';
import './custom_paint.dart';


import 'package:flutter/rendering.dart' show
  debugPaintSizeEnabled,
  debugPaintBaselinesEnabled,
  debugPaintLayerBordersEnabled,
  debugPaintPointersEnabled,
  debugRepaintRainbowEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintLayerBordersEnabled = true;
  // debugPaintPointersEnabled = true;
  // debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'login': (context) => LoginRoute(),
        'counter': (context) => CounterWidget(),
        'layout': (context) => TestStack(),
        'container': (context) => TestContainer(),
        'scroll': (context) => InfiniteListView(),
        'inherited': (context) => InheritedWidgetTestRoute(),
        'theme': (context) => ThemeTestRoute(),
        'event': (context) => Event01Test(),
        'animation': (context) => HeroAnimationRoute(),
        'turn-box': (context) => TurnBoxRoute(),
        'custom-paint': (context) => CustomPaintRoute(),
      }
    );
  }
}

class GotoPageButton extends StatelessWidget {
  const GotoPageButton({
    Key key,
    @required this.name,
    @required this.routeName
  }) : super(key: key);

  final String name;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: FlatButton(
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
        child: Text(name, style: TextStyle(fontSize: 18.0, color: Colors.white),),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  DateTime _lastPressedTime;
  List _tabs = ['Tab A', 'Tab B', 'Tab C'];

  @override
  Widget build(BuildContext context) {
    bus.on('login', (arg) {
      print('login !!!!!!');
    });

    return DefaultTabController(
      length: this._tabs.length,
      child: Scaffold(
        appBar: AppBar( // 导航栏
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          title: Text('My APP'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
            )
          ],
          bottom: TabBar(
            tabs: this._tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        drawer: MyDrawer(), // 抽屉
        body: WillPopScope( // 导航返回拦截
          onWillPop: () async {
            if (this._lastPressedTime == null || DateTime.now().difference(this._lastPressedTime) > Duration(seconds: 1)) {
              this._lastPressedTime = DateTime.now();
              return false;
            }
            return true;
          },
          child: Center(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TapboxA(),
                    TapboxB(),
                    // Expanded(
                    //   child: Container(child: TapboxA(), padding: EdgeInsets.all(5),),
                    //   flex: 1
                    // ),
                    // Expanded(child: TapboxB(), flex: 1),
                  ],
                ),
                GotoPageButton(name: '计数器', routeName: 'counter'),
                GotoPageButton(name: '布局 Widgets', routeName: 'layout'),
                GotoPageButton(name: '容器 Widgets', routeName: 'container'),
                GotoPageButton(name: '可用滚动 Widgets', routeName: 'scroll'),
                GotoPageButton(name: '数据共享', routeName: 'inherited'),
                GotoPageButton(name: '主题', routeName: 'theme'),
                GotoPageButton(name: '事件', routeName: 'event'),
                GotoPageButton(name: '动画', routeName: 'animation'),
                GotoPageButton(name: 'TurnBox', routeName: 'turn-box'),
                GotoPageButton(name: '绘制 widget', routeName: 'custom-paint'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar( // 底部导航栏
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.redAccent,
          onTap: (int index) {
            setState(() {
              this._selectedIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {}
        ),
      )
    );
  }
}


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // 用户栏
          Container(
            color: Colors.grey[300],
            height: 120.0,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    'assets/images/add.svg',
                    color: Colors.grey,
                    semanticsLabel: 'A red up arrow'
                  )
                ),
                Text('Simeon', style: TextStyle(fontWeight: FontWeight.w900))
              ]
            )
          ),
          // 选项栏
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading:  Icon(Icons.add),
                  title: Text('Add account')
                ),
                ListTile(
                  leading:  Icon(Icons.settings),
                  title: Text('Manage accounts')
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
