/**
 * 提示
 */
import 'package:flutter/material.dart';

class SnackBarDemo extends StatefulWidget {
  SnackBarDemo({Key key}) : super(key: key);

  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnakeBar() {
    _bottomSheetScaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Processing...'),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {}
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(title: Text('SnackBar')),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          child: Text('显示 snake_bar'),
          onPressed: _showSnakeBar
        ),
      ),
    );
  }
}
