import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app_test01/counter.dart';
import 'package:flutter_app_test01/tapboxs.dart';
import 'package:flutter_app_test01/login.dart';
import 'package:flutter_app_test01/layout.dart';
import 'package:flutter_app_test01/container.dart';
import 'package:flutter_app_test01/scrollable.dart';
import 'package:flutter_app_test01/inherited_widget.dart';
import 'package:flutter_app_test01/theme.dart';
import 'package:flutter_app_test01/event.dart';

void main() => runApp(MyApp());

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
      }
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: FlatButton(
                    color: Colors.blue,
                    // colorBrightness: Brightness.dark,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(20.0),
                    child: Text.rich(TextSpan(
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                      children: [
                        TextSpan(text: 'open '),
                        TextSpan(text: 'Counter Page', style: TextStyle(fontSize: 24.0, decoration: TextDecoration.underline))
                      ],
                    )),
                    onPressed: () {
                      Navigator.pushNamed(context, 'counter');
                      // Navigator.push(context, new MaterialPageRoute(
                      //   builder: (context) {
                      //     return new CounterWidget();
                      //   },
                      //   maintainState: false,
                      //   // fullscreenDialog: true
                      // ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(10.0),
                    child: Text('布局 Widgets', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                    onPressed: () {
                      Navigator.pushNamed(context, 'layout');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(10.0),
                    child: Text('容器 Widgets', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                    onPressed: () {
                      Navigator.pushNamed(context, 'container');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(10.0),
                    child: Text('可用滚动 Widgets', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                    onPressed: () {
                      Navigator.pushNamed(context, 'scroll');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(10.0),
                    child: Text('数据共享', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                    onPressed: () {
                      Navigator.pushNamed(context, 'inherited');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(10.0),
                    child: Text('主题', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                    onPressed: () {
                      Navigator.pushNamed(context, 'theme');
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(10.0),
                    child: Text('事件', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                    onPressed: () {
                      Navigator.pushNamed(context, 'event');
                    },
                  ),
                ),
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
