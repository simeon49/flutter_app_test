import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app_test01/counter.dart' show CounterWidget;
import 'package:flutter_app_test01/tapboxs.dart' show TapboxA, TapboxB;
import 'package:flutter_app_test01/login.dart' show LoginRoute;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          // IconButton(
          //   icon: Icons.threesixty, // bug here!
          //   onPressed: () {
          //     Navigator.pushNamed(context, 'login');
          //   },
          // )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: true,
            ),
            Checkbox(
              value: true
            ),
            Container(
              // child: Image(image: AssetImage('assets/images/aboutus.svg')),
              child: SvgPicture.asset(
                'assets/images/add.svg',
                color: Colors.grey,
                semanticsLabel: 'A red up arrow'
              ),
              width: 100.0,
            ),
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
                    TextSpan(text: 'Counter Pag', style: TextStyle(fontSize: 24.0, decoration: TextDecoration.underline))
                  ],
                )),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                  // Navigator.push(context, new MaterialPageRoute(
                  //   builder: (context) {
                  //     return new CounterWidget();
                  //   },
                  //   maintainState: false,
                  //   // fullscreenDialog: true
                  // ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
