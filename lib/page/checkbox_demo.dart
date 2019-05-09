/**
 * radio
 */
import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  CheckBoxDemo({Key key}) : super(key: key);

  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _valueA = true;
  bool _valueListTile = true;

  Widget _checkBoxA() => Checkbox(
    value: _valueA,
    onChanged: (value) {
      setState(() {
        _valueA = value;
      });
    },
    activeColor: Colors.black,
  );

  Widget _checkBoxListTile() => CheckboxListTile(
    value: _valueListTile,
    onChanged: (value) {
      setState(() {
        _valueListTile = value;
      });
    },
    title: Text('标题'),
    subtitle: Text('副标题'),
    activeColor: Colors.red,
    isThreeLine: true,
    // dense: true,
    secondary: Icon(Icons.bookmark),
    selected: _valueListTile,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('复选框')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _checkBoxA(),
              ],
            ),
            _checkBoxListTile(),
          ],
        ),
      )
    );
  }
}
