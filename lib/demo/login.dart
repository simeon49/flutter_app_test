import 'dart:io';

import 'package:flutter/material.dart';
import './event.dart';
import 'package:path_provider/path_provider.dart';

class LoginRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginRouteState();
  }
}

class _loginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey _formKey =GlobalKey();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Form(
          key: this._formKey, // 设置globalKey，用于后面获取FormState
          autovalidate: false, // 开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: this._unameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  icon: Icon(Icons.person)
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null : '用户名不能为空';
                },
              ),
              TextFormField(
                autofocus: true,
                controller: this._passwordController,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '登录密码',
                  icon: Icon(Icons.lock)
                ),
                obscureText: true,
                validator: (v) {
                  return v.trim().length > 5 ? null : '密码不能少于6位';
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 28.0),
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Text('登录'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () async {
                          if ((_formKey.currentState as FormState).validate()) {
                            print('通过验证');
                            // Directory appDocDir = await getApplicationDocumentsDirectory() as Directory;
                            // String appDocPath = appDocDir.path;

                            bus.emit('login');
                          }
                        },
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
