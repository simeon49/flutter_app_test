/**
 * 中高级练习
 */
import 'package:flutter/material.dart';
import './form_demo.dart';
import './material_compents.dart';

class ExperDemo extends StatefulWidget {
  ExperDemo({Key key}) : super(key: key);

  _ExperDemoState createState() => _ExperDemoState();
}

class _ExperDemoState extends State<ExperDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('中高级练习')),
      body: ListView(
        children: <Widget>[
          ListItem(title: '表格', page: FormDemoRoute()),
          ListItem(title: 'material 组件', page: MaterialCompents()),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.title,
    @required this.page
  }) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return page;
          })
        );
      },
    );
  }
}
