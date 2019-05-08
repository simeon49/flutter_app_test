/**
 * 表格Form
 */
import 'package:flutter/material.dart';

class FormRoute extends StatefulWidget {
  FormRoute({Key key}) : super(key: key);

  _FormRouteState createState() => _FormRouteState();
}

class _FormRouteState extends State<FormRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form')),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFieldDemo()
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * TextFiled
 */
class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key key}) : super(key: key);

  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    debugPrint('hi');
    _controller.text = 'Simeon';
    _controller.addListener(() {
      debugPrint('input: ${_controller.text}');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        icon: Icon(Icons.account_box),
        labelText: '用户名',
        hintText: '请输入用户名',
        border: OutlineInputBorder(),
      ),
      // onChanged: (value) {
      //   debugPrint('[changed] ${value}');
      // },
      // onSubmitted: (value) {
      //   debugPrint('[submitted] ${value}');
      // },
    );
  }
}
