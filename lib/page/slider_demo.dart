/**
 * 滑块 slider
 */
import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  SliderDemo({Key key}) : super(key: key);

  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _value = 10.0;

  void _onChangeHandler(value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('滑块')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 162.0,
              width: 300.0,
              child: Slider(
                value: _value,
                min: 0.0,
                max: 100.0,
                divisions: 10,  // 分段
                label: '当前值: $_value',
                onChanged: _onChangeHandler,
                // activeColor: Colors.red,
                // inactiveColor: Colors.grey
              ),
            ),
            Text('Slider value: ${_value}')
          ],
        ),
      )
    );
  }
}
