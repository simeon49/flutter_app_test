/**
 * checkbox
 */
import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  RadioDemo({Key key}) : super(key: key);

  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _raidoValue = 2;

  void _onChangeHandler(value) {
    setState(() {
      _raidoValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('单选按钮')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: _raidoValue,
                  onChanged: _onChangeHandler,
                ),
                Radio(
                  value: 2,
                  groupValue: _raidoValue,
                  onChanged: _onChangeHandler,
                ),

              ],
            ),
            RadioListTile(
              value: 3,
              groupValue: _raidoValue,
              onChanged: _onChangeHandler,
              title: Text('标题'),
              subtitle: Text('副标题'),
              selected: _raidoValue == 3,
              secondary: Icon(Icons.bookmark),
            )
          ],
        ),
      )
    );
  }
}
