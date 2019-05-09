/**
 * 开关Switch
 */
import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  SwitchDemo({Key key}) : super(key: key);

  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _value = true;

  void _onChangeHandler(value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('开关')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_value ? 'Ok' : 'Fail'),
                Switch(
                  value: _value,
                  onChanged: _onChangeHandler,
                ),
              ],
            ),
            SwitchListTile(
              value: _value,
              onChanged: _onChangeHandler,
              title: Text('标题'),
              subtitle: Text('副标题'),
              selected: _value,
              secondary: Icon(Icons.bookmark),
            )
          ],
        ),
      )
    );
  }
}
