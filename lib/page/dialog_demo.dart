/**
 * 对话框 dialog
 */
import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  DialogDemo({Key key}) : super(key: key);

  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  String _selectedOption = '';

  void _showSimpleDialog() {
    void _selectedHandler(value) {
      setState(() {
        _selectedOption = value;
      });
      Navigator.pop(context);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('标题'),
          backgroundColor: Colors.yellow,
          children: <Widget>[
            SimpleDialogOption(
              child: Text('选项 A'),
              onPressed: () => _selectedHandler('A'),
            ),
            SimpleDialogOption(
              child: Text('选项 B'),
              onPressed: () => _selectedHandler('B'),
            )
          ],
        );
      }
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('标题'),
          actions: [
            FlatButton(child: Text('确定'), onPressed: () {Navigator.pop(context);}),
            FlatButton(child: Text('取消'), onPressed: () {Navigator.pop(context);})
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('对话框')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('SimpleDialog: ${_selectedOption}'),
              onPressed: _showSimpleDialog,
            ),
            RaisedButton(
              child: Text('AlertDialog'),
              onPressed: _showAlertDialog,
            )
          ],
        ),
      )
    );
  }
}
