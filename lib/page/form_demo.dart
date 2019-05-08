/**
 * 表格Form
 */
import 'package:flutter/material.dart';

class FormDemoRoute extends StatefulWidget {
  FormDemoRoute({Key key}) : super(key: key);

  _FormDemoRouteState createState() => _FormDemoRouteState();
}

class _FormDemoRouteState extends State<FormDemoRoute> {
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
              // TextFieldDemo()
              RegisterFrom()
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


class RegisterFrom extends StatefulWidget {
  RegisterFrom({Key key}) : super(key: key);

  _RegisterFromState createState() => _RegisterFromState();
}

class _RegisterFromState extends State<RegisterFrom> {
  final formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  String userName, password;

  String userNameValidate(value) {
    if (value.isEmpty) {
      return 'UserName is required.';
    }
    return null;
  }

  String passWordValidate(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    } else if (value.length < 3) {
      return 'Password length must >= 3';
    }
    return null;
  }

  void login() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      debugPrint('userName: ${userName}');
      debugPrint('password: ${password}');

      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('login ...'))
      );
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidate: autoValidate,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: '请输入用户名',
            ),
            validator: userNameValidate,
            onSaved: (value) {
              userName = value;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: '请输入密码'
            ),
            validator: passWordValidate,
            onSaved: (value) {
              password = value;
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 32.0),
            width: double.infinity,
            child: RaisedButton(
              child: Text('登录', style: TextStyle(color: Colors.white),),
              color: Theme.of(context).accentColor,
              onPressed: login,
              elevation: 0.0,
            ),
          )
        ],
      )
    );
  }
}
