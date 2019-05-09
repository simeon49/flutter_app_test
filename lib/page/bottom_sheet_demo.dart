/**
 * BottomSheet 窗口底部 sheet
 */
import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  BottomSheetDemo({Key key}) : super(key: key);

  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  String _option = '';

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(child: Text('选项 A'), onPressed: () {Navigator.pop(context);}),
              FlatButton(child: Text('选项 B'), onPressed: () {Navigator.pop(context);}),
              FlatButton(child: Text('选项 C'), onPressed: () {Navigator.pop(context);}),
            ],
          ),
        ),
      );
    });
  }

  Future<void> _openModalBottomSheet() async {
    String res = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(child: Text('选项 A'), onPressed: () {Navigator.pop(context, 'A');}),
              FlatButton(child: Text('选项 B'), onPressed: () {Navigator.pop(context, 'B');}),
              FlatButton(child: Text('选项 C'), onPressed: () {Navigator.pop(context, 'C');}),
            ],
          ),
        );
      }
    );
    if (res == null) return;

    setState(() {
      _option = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(title: Text('BottomSheet')),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('打开底部sheet'),
              onPressed: _openBottomSheet,
            ),
            RaisedButton(
              child: Text('打开ModalBottomSheet: ${_option}'),
              onPressed: _openModalBottomSheet,
            ),
          ],
        )
      ),
    );
  }
}
