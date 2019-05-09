/**
 * datetime
 */
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDemo extends StatefulWidget {
  DateTimeDemo({Key key}) : super(key: key);

  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 10, minute: 20);

  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date == null) return;
    setState(() {
      _dateTime = date;
    });
  }


  Future<void> _selectTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
    );

    if (time == null) return;
    setState(() {
      _timeOfDay = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('日期')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectDate,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      textTheme: TextTheme(
                      )
                    ),
                    child: Row(
                      children: <Widget>[
                        Text('请选择日期: '),
                        Text(DateFormat.yMd().format(_dateTime), style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: <Widget>[
                      Text('请选择日期时间: '),
                      Text(_timeOfDay.format(context), style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
