/**
 * Material 风格组件
 */
import 'package:flutter/material.dart';


class MaterialCompents extends StatefulWidget {
  MaterialCompents({Key key}) : super(key: key);

  _MaterialCompentsState createState() => _MaterialCompentsState();
}

class _MaterialCompentsState extends State<MaterialCompents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Material 风格组件')),
      body: ListView(
        children: <Widget>[
          ListItem(title: '浮动按钮', page: FloatingActionButtonDemo()),
          ListItem(title: '按钮', page: ButtonDemo()),
        ],
      ),
    );
  }
}

/* -------------------- 浮动按钮 -------------------- */
class FloatingActionButtonDemo extends StatelessWidget {

  Widget _floatingActionButton = FloatingActionButton(
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.green,
    // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    onPressed: () {},
  );

  Widget _floatingActionButtonExtend = FloatingActionButton.extended(
    icon: Icon(Icons.add),
    label: Text('add'),
    onPressed: () {},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('浮动按钮')),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}


/* -------------------- 按钮 -------------------- */
class ButtonDemo extends StatelessWidget {

  // ------------- flat button -------------
  Widget _flatButton = FlatButton(
    child: Text('FlatButton'),
    splashColor: Colors.grey,
    onPressed: () {},
  );

  Widget _flatButtonIcon = FlatButton.icon(
    icon: Icon(Icons.add),
    label: Text('IconButton'),
    onPressed: () {},
  );

  // ------------- raised button -------------
  Widget _raisedButton = RaisedButton(
    child: Text('FlatButton'),
    splashColor: Colors.grey,
    onPressed: () {},
    elevation: 0.0,
  );

  Widget _raiseButtonIcon = RaisedButton.icon(
    icon: Icon(Icons.add),
    label: Text('IconButton'),
    onPressed: () {},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('按钮')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _flatButton,
              SizedBox(width: 16.0),
              _flatButtonIcon,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _raisedButton,
              SizedBox(width: 16.0),
              _raiseButtonIcon,
            ],
          ),
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
      leading: Icon(Icons.mail_outline),
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
