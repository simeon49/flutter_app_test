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
  Widget _flatButton(BuildContext context) {
    return FlatButton(
      child: Text('FlatButton'),
      splashColor: Colors.grey,
      onPressed: () {},
    );
  }

  Widget _flatButtonIcon(BuildContext context) {
    return FlatButton.icon(
      icon: Icon(Icons.add),
      label: Text('IconButton'),
      onPressed: () {},
    );
  }

  // ------------- raised button -------------
  Widget _raisedButton(BuildContext context) {
    return RaisedButton(
      child: Text('RaisedButton'),
      // splashColor: Theme.of(context).primaryColor,
      onPressed: () {},
      elevation: 0.0,
    );
  }

  Widget _raisedButtonIcon(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.add),
      label: Text('IconButton'),
      // splashColor: Theme.of(context).primaryColor,
      onPressed: () {},
    );
  }

  // ------------- outline button -------------
  Widget _outlineButton(BuildContext context) {
    return OutlineButton(
      child: Text('OutlineButton'),
      borderSide: BorderSide(
        color: Colors.black
      ),
      splashColor: Colors.grey,
      onPressed: () {},
    );
  }

  Widget _outlineButtonIcon(BuildContext context) {
    return OutlineButton.icon(
      icon: Icon(Icons.add),
      label: Text('IconButton'),
      onPressed: () {},
    );
  }

  // ------------- container button -------------
  Widget _buttonWithSize(BuildContext context) {
    return Container(
      width: 200.0,
      height: 60.0,
      child: OutlineButton(
        child: Text('FlatButton'),
        onPressed: () {},
      )
    );
  }

  Widget _buttonExtend(BuildContext context) {
    return Expanded(
      child: OutlineButton(
        child: Text('FlatButton'),
        onPressed: () {},
      )
    );
  }

  // ------------- popup menu button -------------
  String value = 'home';
  Widget _popupMenuButton(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        debugPrint(value);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'home',
          child: Text('Home'),
        ),
        PopupMenuItem(
          value: 'discover',
          child: Text('Discover'),
        ),
        PopupMenuItem(
          value: 'comunity',
          child: Text('Comunity'),
        )
      ]
    );
  }

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
              _flatButton(context),
              SizedBox(width: 16.0),
              _flatButtonIcon(context),
            ],
          ),
          Theme(  // 修改主题
            data: Theme.of(context).copyWith(
              bottomAppBarColor: Colors.yellow,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(30.0)
                // ),
                shape: StadiumBorder ()
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _raisedButton(context),
                SizedBox(width: 16.0),
                _raisedButtonIcon(context),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _outlineButton(context),
              SizedBox(width: 16.0),
              _outlineButtonIcon(context),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buttonWithSize(context),
              SizedBox(width: 16.0),
              _buttonExtend(context),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _popupMenuButton(context)
            ],
          )
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
